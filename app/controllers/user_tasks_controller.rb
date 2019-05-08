class UserTasksController < ApplicationController
  before_action :logged_in_user
  before_action :load_user_task, only: %i(edit update)

  def create
    @user_task = UserTask.new user_tasks_params
    @user_task.status = UserTask.statuses[:in_progress]
    if @user_task.save
      @success_adding_message =
        t "controllers.user_tasks_controller.pick_task_success"
    else
      @failed_adding_message =
        t "controllers.user_tasks_controller.pick_task_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    if @user_task.update user_tasks_params
      flash[:success] = t "controllers.user_tasks_controller.update_success"
      redirect_to course_subject_path @user_task.task.course_subject_id
    else
      render :edit
    end
  end

  private

  def user_tasks_params
    params.require(:user_task).permit :user_id, :task_id, :status,
      :short_description
  end

  def load_user_task
    @user_task = UserTask.find_by id: params[:id]
    return if @user_task
    flash[:danger] = t "controllers.user_tasks_controller.user_task_not_found"
    redirect_to root_path
  end
end
