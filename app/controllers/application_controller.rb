class ApplicationController < ActionController::Base
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_filter :check_steps

  before_filter :set_locale

  protect_from_forgery with: :exception

  private

  def set_locale
    I18n.locale = params[:locale].present? ? params[:locale] : I18n.default_locale
  end

  def default_url_options(options = {})
    user_signed_in? ? options : options.merge({locale: I18n.locale})
  end

  def check_admin_or_manager
    (current_user && (current_user.admin? || current_user.manager?)) || permission_deny
  end

  def check_admin
    (current_user && current_user.admin?) || permission_deny
  end

  def permission_deny
    redirect_to(root_path, alert: 'You dont have permissions to this area!')
    false
  end

  def check_steps
    # for authorized users
    if user_signed_in? && current_user.user?
      check_contacts if controller_name.eql?('certificates')
      check_personal if controller_name.eql?('contacts')
      check_certificates if controller_name.eql?('seaservices')

      if controller_name.eql?('langs')
        check_contacts && check_personal && check_certificates
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
      session[:original_account_id] = current_user && current_user.id

      sign_in user #, store: false
      redirect_to new_personal_path
      return
    end
  end

end
