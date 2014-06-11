class UsersController < ApplicationController
  skip_filter :authenticate_user!, :if => proc { |c| [:crewing, :create_crewing, :enter, :get_access].include?(c.action_name.to_sym) }
  layout 'light', only: [:enter, :complete, :finish]
  before_filter :check_access, only: [:index, :create_seafarer]

  def index
    if params[:scope].eql?('all')
      @users = User.users
      unless current_user.admin?
        @users = @users.where(crew_id: current_user.crew_id)
      end

    else
      @users = User.users.joins(:personal)
      scope_personals
      scope_langs
      scope_seaservices
    end

    @users = @users.page(params[:page]).per(10)
  end

  def agencies
    @agencies = User.agencies.newer.page(params[:page]).per(10)
  end

  def activate_agency
    @agency = User.agencies.find(params[:id])

    @agency.verified? ? @agency.deverify! : @agency.verify!

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { @agency = @agency.decorate }
    end
  end

  def managers
    unless current_user.verified?
      flash[:notice] = 'You have to be verified for create new Managers.'
    end
    @user = User.new
    @managers = current_user.managers.newer.page(params[:page]).per(10)
  end

  def create_manager
    @user = User.create_manager(user_params, current_user)
    logger.info("Create crewing #{@user.errors.full_messages.join("\n")}")


    respond_to do |format|
      if @user.save
        format.html { redirect_to managers_path, notice: 'Manager has been created!' }
        format.js { render text: "window.location = '#{managers_path}'" }
      else
        format.html { redirect_to managers_path, warning: @user.errors.full_messages.join("\n") }
        format.js { render text: "$('.new_manager').html('#{j render 'manager_form', locals: {user: @user}}')" }
      end
    end
  end

  def create_seafarer
    original_account_id = current_user.id
    @user = User.create_seafarer(user_params, current_user)
    if @user.valid?
      sign_in @user
      session[:original_account_id] = original_account_id
      redirect_to new_personal_path, notice: "You logged as #{@user.email}, please fill the form!"
    else
      redirect_to :back, warning: @user.errors.full_messages.join(", ")
    end
  end

  def back
    sign_in(User.find(session[:original_account_id])) ?
      redirect_to(root_path, notice: 'Wellcome back!') :
      redirect_to(root_path, error: 'Bad session!')
  end

  def lock
    if @user = current_user.managers.find(params[:id])
      @user.access_locked? ? @user.unlock_access! : @user.lock_access!
      @user = @user.decorate
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { @user = @user.decorate }
    end
  end

  def crewing
    @user = User.new
    @user.role = 'crewing'
  end

  def create_crewing
    @user = User.create_crewing(user_params)
    logger.info("Create crewing #{@user.errors.full_messages.join("\n")}")

    if @user.present?
      flash[:notice] = 'Crewing Agency has been created. Please check your email with credentials, and wait administration phone call!'
    end

    render 'crewing'
  end

  def enter
    if current_user
      redirect_to(new_personal_path)
      return
    end

    @user = User.new
  end

  def complete
    @user = current_user
    if @user.update(user_params)
      Notifications.thank_email(@user).deliver
      redirect_to finish_users_path
    else
      redirect_to :back, notice: @user.errors.full_messages.join(', ')
    end
  end

  def finish
    current_user.cv_updated!
    @user = current_user.decorate
  end

  def cv
    @user = User.find_by_uuid(params[:id])
    if Rails.env.development? && @user.nil?
      @user = User.find_by_id(params[:id]).decorate
    end

    @contact = @user.contact
    @user_contact = @contact.decorate
    if user_signed_in?
      logger.info("CURRENT_USER #{current_user.role} #{current_user.name} #{current_user.id}")
      #Admin
      if current_user.admin?
        logger.info('ADMIN ->>')
        @contact = current_user.contact if params[:original].blank?
        #Agency
      elsif (current_user.manager? || current_user.crewing?)
        logger.info('CREW ->>')
        # анкета принадлежит агенству и не надо оригинальные контакты
        # Подставляем контакты агенства
        # анкета принадлежит агенству и менеджер  или пользователь является агенством которое приписсаломоряка
        if (@user.agency.eql?(current_user.agency) || @user.crew_id.eql?(current_user.id))
          logger.info('CREW OWN->>')
          @contact = @user.agency.contact if params[:original].blank?
        else # не принадлежит агенству
          @contact = @user.head_contact
        end
      elsif current_user.user?
        @contact = @user.head_contact if !@user.id.eql?(current_user.id)
      end

    else
      logger.info('Guest')
      #Guest
      @contact = @user.head_contact
    end

    @hide_details = !@contact.id.eql?(@user.contact.id)

    @contact = @contact.decorate

    @personal = @user.personal.decorate
    @documents = @user.documents.decorate
    @seaservices = @user.seaservices.last_years(5).decorate
    @certificates = @user.certificates.decorate
    @last_medical_certificate = @user.medical_certificates.last
    @langs = @user.langs.includes(:language)

    @user = @user.decorate
    #https://github.com/mileszs/wicked_pdf
    respond_to do |format|
      format.html { render layout: 'cv' }
      format.pdf {
        render({
                 pdf: "#{@personal.pdf_file_name}.pdf",
                 layout: 'layouts/cv.pdf.haml',
                 disable_javascript: true,
                 show_as_html: params[:debug].present?,
                 #save_to_file: Rails.root.join('public', "#{@user.uuid}.pdf"),
                 margin: {top: 10,
                          bottom: 0,
                          left: 10,
                          right: 0}
               })
      }
    end

  end

  def get_access
    @present = false
    @user = User.find_by(email: user_params[:email])
    # Если первый раз пользователь ввел емейл
    unless @user
      @user = User.create_by_email(user_params)
      unless @user.new_record?
        sign_in @user
        render text: "window.location = '#{new_personal_path}';"
      else
        # нет мыла или подтверждение не совпадает
      end
      return
    end

    unless @user.new_record?
      @present = true
      Notifications.access_link(@user).deliver
    else
      flash.now[:error] = @user.errors.full_messages.join(',')
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :email_confirmation, :phone, :company_name, :country_id, :accept_subscription)
  end

  def check_access
    if user_signed_in?
      return true if current_user.admin?
      return true if current_user.crewing? && current_user.verified?
      return true if current_user.manager?
    else
      flash[:error] = 'You dont have access to this page.'
      return false
    end
  end

  def scope_langs
    if params[:language_id].present?
      langs_scope = []
      langs_scope << "langs.language_id =  #{params[:language_id]}"
      langs_condition = "SELECT user_id FROM langs WHERE #{langs_scope.join('AND')}"
      @users = @users.where("users.id IN (#{langs_condition})")
    end
  end

  def scope_seaservices
    if params[:vessel_type_id].present? || params[:vessel_dwt].present?
      seaservices_scope = []
      seaservices_scope << "seaservices.vessel_type_id = #{params[:vessel_type_id]}" if params[:vessel_type_id].present?
      seaservices_scope << "seaservices.vessel_dwt > #{params[:vessel_dwt]}" if params[:vessel_dwt].present?
      seaservices_scope = "SELECT user_id FROM seaservices WHERE #{seaservices_scope.join(' AND ')}"
      @users = @users.where("users.id IN (#{seaservices_scope})")
    end
  end

  def scope_personals
    @users = @users.where('personals.rank_id = ?', params[:rank_id]) if params[:rank_id].present?
    @users = @users.where('personals.country_id = ?', params[:country_id]) if params[:country_id].present?
    @users = @users.where('personals.salary <= ?', params[:salary]) if params[:salary].present?
    @users = @users.where('YEAR(CURRENT_DATE) - YEAR(personals.pp_dob) <= ?', params[:years]) if params[:years].present?
  end

end
