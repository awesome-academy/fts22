class Trainer::BaseController < ApplicationController
  layout "trainer/application"

  private

  def current_ability
    @current_ability ||=
      Ability.new(current_user, Settings.app.controller.namespace_for_trainer)
  end
end
