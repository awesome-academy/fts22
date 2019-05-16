class Admin::BaseController < ApplicationController
  layout "admin/application"

  private

  def current_ability
    @current_ability ||=
      Ability.new(current_user, Settings.app.controller.namespace_for_admin)
  end
end
