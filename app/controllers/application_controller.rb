class ApplicationController < ActionController::Base
  before_action :set_locale, :authenticate_user!
  rescue_from CanCan::AccessDenied do
    respond_to do |format|
      format.html do
        flash[:danger] = t "controllers.autorization_fail"
        redirect_to root_path
      end
      format.js{render nothing: true, status: 404}
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def current_ability
    @current_ability ||= Ability.new(current_user, "")
  end
end
