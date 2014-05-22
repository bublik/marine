class UsersController < ApplicationController
  skip_filter :authenticate_user!, :if => proc { |c| [:crewing, :create_crewing, :enter, :get_access].include?(c.action_name.to_sym) }
  layout 'light', only: [:enter, :complete, :finish]
  before_filter :check_access, only: [:index]

  def index
    flash[:warning] = 'TODO ADD users permission scope!!!'
    @users = User.all.decorate
  end

  def show
    @user = User.find(params[:id])
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
        format.html { redirect_to managers_path, error: @user.errors.full_messages.join("\n") }
        format.js { render text: "$('.new_manager').html('#{j render 'manager_form', locals: {user: @user}}')" }
      end
    end
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

  # only manager
  def search

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
    logger.debug("DEBUG #{params[:debug].present?}")
    @contact = @user.contact.decorate
    @personal = @user.personal.decorate
    @documents = @user.documents.decorate
    @seaservices = @user.seaservices.last_years(5).decorate
    @certificates = @user.certificates.decorate
    @last_medical_certificate = @user.medical_certificates.last
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
    unless user_signed_in?
      flash[:error] = 'You dont have access to this page.'
      return false
    end
    true
  end
end
