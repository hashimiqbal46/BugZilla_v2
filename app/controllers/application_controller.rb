class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protected

  def user_not_authorized
    policy_name = exception.policy.class.to_s.underscore
    flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name, :user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :name, :user_type, :password_confirmation])
  end


end