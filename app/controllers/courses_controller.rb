class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :load_course, only: :show

  def index
    @courses = current_user.courses.newest.paginate page: params[:page],
      per_page: Settings.app.models.course.course_per_page
  end

  def show; end

  private

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "controllers.courses_controller.course_not_found"
    redirect_to courses_path
  end
end
