class CoursesController < ApplicationController
  before_action :logged_in_user

  def index
    @courses = current_user.courses.newest.paginate page: params[:page],
      per_page: Settings.app.models.course.course_per_page
  end
end
