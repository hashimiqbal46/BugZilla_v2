class RegistrationsController < Devise::RegistrationsController
    before_action :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
      devise_parameter_sanitizer.permit(:update, keys: [:name, :email, :password, :password_confirmation, :current_password,:user_type])
    end
end