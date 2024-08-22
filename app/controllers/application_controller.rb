class ApplicationController < ActionController::Base
  helper Railsui::ThemeHelper

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_institution, :signed_in?

  def current_institution
    @current_institution ||= Institution.find(session[:institution_id]) if session[:institution_id]
  end

  def signed_in?
    !!current_institution
  end

  def custom_sign_in(institution)
    session[:institution_id] = institution.id
  end

  def custom_sign_out
    session[:institution_id] = nil
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :name])
  end

  def after_sign_in_path_for(resource)
    institutions_path
  end
end
