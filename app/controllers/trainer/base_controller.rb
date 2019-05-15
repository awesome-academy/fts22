class Trainer::BaseController < ApplicationController
  before_action :is_trainer?
  layout "trainer/application"
end
