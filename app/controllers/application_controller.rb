class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, unless: :devise_controller?
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :username, :email, :password, :password_confirmation, :remember_me, :image]
    devise_parameter_sanitizer.permit :sign_in, keys: [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :username, :birth, :image, :email]
  end
  
  private
  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_in_path_for(resource)
    request.env["omniauth.origin"] || stored_location_for(resource) || root_path
  end

  def after_sign_out_path_for(resource)
    request.env["omniauth.origin"] || stored_location_for(resource) || root_path
  end
end
