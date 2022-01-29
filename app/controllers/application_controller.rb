class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def self.default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] if locale.present?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :neighborhood, :terms_of_service])
  end
end
