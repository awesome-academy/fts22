class Admin::CourseSubjectsController < Admin::BaseController
  before_action :load_course_subject, only: :destroy

  def create
    @course_subject = CourseSubject.new course_subject_params
    if @course_subject.save
      @success_adding_message =
        t "admin.controllers.course_subjects_controller.created_success"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @course_subject.destroy
      @delete_message =
        t "admin.controllers.course_subjects_controller.delete_success"
    else
      @delete_message =
        t "admin.controllers.course_subjects_controller.delete_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def course_subject_params
    params.require(:course_subject).permit :subject_id, :course_id, :start_date,
      :end_date
  end

  def load_course_subject
    @course_subject = CourseSubject.find_by id: params[:id]
    return if @course_subject
    flash[:danger] =
      "admin.controllers.course_subjects_controller.course_subject_not_found"
    redirect_to request.referrer || root_path
  end
end
