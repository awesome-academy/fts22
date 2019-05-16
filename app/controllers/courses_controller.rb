class CoursesController < ApplicationController
  authorize_resource :course
  before_action :load_course, only: :show
  before_action :handle_redirect, only: :index

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

  def handle_redirect
    redirect_to admin_courses_path if current_user.admin?
    redirect_to trainer_courses_path if current_user.trainer?
  end
end
