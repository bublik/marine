class UsersController < ApplicationController
  skip_filter :authenticate_user!, :if => proc { |c| [:crewing, :create_crewing, :enter, :get_access].include?(c.action_name.to_sym) }
  layout 'light', only: [:enter, :complete, :finish]

  def index
    @users = [] #User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def crewing
    @user = User.new
    @user.role = 'crewing'
  end

  def create_crewing
    @user = User.create_crewing(user_params)
    logger.info("ERROR create crewing #{@user.errors.full_messages.join("\n")}")

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
end
