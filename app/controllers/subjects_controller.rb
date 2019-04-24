class SubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :load_subject, :load_tasks, only: :show

  def show; end

  private

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    flash[:danger] = t "controllers.subjects_controller.subject_not_found"
    redirect_to root_path
  end

  def load_tasks
    current_tasks = @subject.tasks.of_user(current_user.id)
    @user_tasks = UserTask.by_tasks_id current_tasks.pluck :id
    return if current_tasks & @user_tasks
    flash[:danger] = t "controllers.subjects_controller.load_task_error"
    redirect_to root_path
  end
end
