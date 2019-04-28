class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "controllers.users_controller.not_logged_in_yet"
    redirect_to root_path
  end

  def check_is_admin
    return if current_user.admin?
    flash[:danger] = t "controllers.users_controller.not_admin"
    redirect_to root_path
  end
end
