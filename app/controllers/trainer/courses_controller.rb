class Trainer::CoursesController < Trainer::BaseController
  before_action :load_course, only: :show

  def index
    @courses = current_user.trainer_courses.newest.paginate page: params[:page],
      per_page: Settings.app.models.course.course_per_page
  end

  def show
    @trainees = User.trainee
  end

  private

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "trainer.controllers.courses_controller.course_not_found"
    redirect_to trainer_courses_path
  end
end
