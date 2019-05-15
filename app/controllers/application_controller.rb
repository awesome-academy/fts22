class ApplicationController < ActionController::Base
  before_action :set_locale, :authenticate_user!

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def is_admin?
    return if current_user.admin?
    flash[:danger] = t "controllers.users_controller.not_admin"
    redirect_to root_path
  end

  def is_trainer?
    return if current_user.trainer?
    flash[:danger] = t "controllers.users_controller.not_trainer"
    redirect_to root_path
  end
end
