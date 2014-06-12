class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_filter :check_steps

  protect_from_forgery with: :exception

  private

  def check_steps
    # for authorized users
    if user_signed_in? && current_user.user?
      check_contacts if controller_name.eql?('certificates')
      check_personal if controller_name.eql?('contacts')
      check_certificates if controller_name.eql?('seaservices')

      if controller_name.eql?('langs')
        check_contacts
        check_personal
        check_certificates
      end
    end
  end

  def check_personal
    if current_user.personal.nil?
      redirect_to new_personal_path, notice: 'You have to add Personal information.'
      return false
    end
  end

  def check_contacts
    if current_user.contacts.count < 2
      redirect_to new_contact_path, notice: 'You have to add 2 Contacts, Own and Next of kin.'
      return false
    end
  end

  def check_certificates
    if current_user.certificates.count < 1
      redirect_to new_contact_path, notice: 'You have to at least one Certificate.'
      return false
    end
  end

  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      # store user sesstion
      session[:original_account_id] = current_user.id

      sign_in user #, store: false
      redirect_to new_personal_path
      return
    end
  end

end
