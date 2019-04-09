class CoursesController < ApplicationController
  def index
    @courses = Course.newest.paginate page: params[:page],
      per_page: Settings.app.models.course.course_per_page
  end
end
