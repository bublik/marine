class UsersController < ApplicationController
  skip_filter :authenticate_user!, :if => proc { |c| [:enter, :get_access].include?(c.action_name.to_sym) }
  layout 'light', only: [:enter, :complete, :finish]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
    @user = current_user.decorate
  end

  def cv
    @user = User.find(params[:id])
    @personal = @user.personal.decorate
    @documents = @user.documents.decorate
    @seaservices = @user.seaservices.last_years(5).decorate
    @certificates = @user.certificates.decorate
    @last_medical_certificate = @user.medical_certificates.last

    render layout: 'cv'
  end

  def get_access
    @present = false
    @user = User.find_by(email: user_params[:email])
    @user ||= User.create_by_email(user_params[:email])

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
    params.require(:user).permit(:email, :accept_subscription)
  end
end
