class Trainer::BaseController < ApplicationController
  before_action :logged_in_user, :is_trainer?
  layout "trainer/application"
end
