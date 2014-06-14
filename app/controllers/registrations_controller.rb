class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u|
      u.permit(:name, :email,  :password, :password_confirmation)
    }
    devise_parameter_sanitizer.for(:account_update) {|u|
      u.permit(:name, :email, :phone, :company_name, :password, :password_confirmation, :current_password,
               contact_attributes: [:id, :logo, :country_id, :region, :city, :street, :postal_code, :phone, :mphone, :email, :skype])
    }
  end

end
