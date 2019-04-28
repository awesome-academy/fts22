class CourseSubjectsController < ApplicationController
  before_action :logged_in_user, :load_course_subject, :load_tasks, only: :show

  def show; end

  private

  def load_course_subject
    @course_subject = CourseSubject.find_by id: params[:id]
    return if @course_subject
    flash[:danger] =
      t "controllers.course_subjects_controller.subject_not_found"
    redirect_to root_path
  end

  def load_tasks
    current_tasks = @course_subject.tasks.of_user(current_user.id)
    @user_tasks = UserTask.by_tasks_id current_tasks.pluck :id
    @tasks = @course_subject.tasks.except_task_ids(
      current_user.user_tasks.pluck(:task_id)
    )
  end
end
