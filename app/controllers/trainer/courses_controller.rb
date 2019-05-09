class Trainer::CoursesController < Trainer::BaseController
  before_action :load_course, only: %i(show start_course finish_course)

  def index
    @courses = current_user.trainer_courses.newest.paginate page: params[:page],
      per_page: Settings.app.models.course.course_per_page
  end

  def show
    @trainees = User.trainee
  end

  def start_course
    if @course.update_attributes start_date: Time.now,
      status: Course.statuses[:start]
      adding_user_subject
      @course.notify_to_everyone
      flash[:success] =
        t "trainer.controllers.courses_controller.start_success"
    else
      flash[:danger] =
        t "trainer.controllers.courses_controller.start_fail"
    end
    redirect_to request.referrer || root_path
  end

  def finish_course
    if @course.update_attributes end_date: Time.now + 1.day,
      status: Course.statuses[:finished]
      flash[:success] =
        t "trainer.controllers.courses_controller.finish_success"
    else
      flash[:danger] = "trainer.controllers.courses_controller.finish_fail"
    end
    redirect_to request.referrer || root_path
  end

  private

  def adding_user_subject
    @course.users.each do |user|
      @course.subjects.each do |subject|
        UserSubject.new(
          user_id: user.id,
          subject_id: subject.id
        ).save!
      end
    end
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "trainer.controllers.courses_controller.course_not_found"
    redirect_to trainer_courses_path
  end
end
