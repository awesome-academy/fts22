class Admin::BaseController < ApplicationController
  before_action :is_admin?
  layout "admin/application"
end
