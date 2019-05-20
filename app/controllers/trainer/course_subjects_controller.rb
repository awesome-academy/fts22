class Trainer::CourseSubjectsController < Trainer::BaseController
  authorize_resource :course_subject
  before_action :load_course_subject,
    only: %i(show start_subject finish_subject)

  def show
    @tasks = @course_subject.tasks.order_by_name.paginate page: params[:page],
      per_page: Settings.app.tasks.tasks_per_page
  end

  def start_subject
    unless @course_subject.course.start?
      @start_fail_message =
        t "trainer.controllers.course_subjects_controller.course_not_started"
      respond_to do |format|
        format.js
      end
      return
    end
    if @course_subject.update_attribute :status,
      Settings.app.course_subject.status.started
      @start_success_message =
        t "trainer.controllers.course_subjects_controller.start_success"
    else
      @start_fail_message =
        t "trainer.controllers.course_subjects_controller.start_failed"
    end
    respond_to do |format|
      format.js
    end
  end

  def finish_subject
    if @course_subject.update_attribute :status,
      Settings.app.course_subject.status.finished
      @finish_success_message =
        t "trainer.controllers.course_subjects_controller.finish_success"
    else
      @finish_fail_message =
        t "trainer.controllers.course_subjects_controller.finish_failed"
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def load_course_subject
    @course_subject = CourseSubject.find_by id: params[:id]
    return if @course_subject
    flash[:danger] =
      t "trainer.controllers.course_subjects_controller.not_found"
    redirect_to request.referrer || root_path
  end
end
