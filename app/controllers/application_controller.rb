class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  protect_from_forgery with: :exception

  private

  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      # store user sesstion
      session[:original_account_id] = current_user.id

      sign_in user#, store: false
      redirect_to new_personal_path
      return
    end
  end

end
