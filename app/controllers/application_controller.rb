class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery
  include Pundit
  rescue_from Pundit::NotAuthorizedError do |exception|
    policy = exception.policy

    if policy.respond_to?(:policy_error_message) && policy.policy_error_message.present?
      message = policy.policy_error_message
    else
      policy_name = exception.policy.class.to_s.underscore
      query = exception.query
      message = t("#{policy_name}.#{query}", scope: "pundit", default: :default)
    end

     flash[:error] = message
     redirect_to(request.referrer || root_path)
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :name, :user_type, :password_confirmation])
  end


end