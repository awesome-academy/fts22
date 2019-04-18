class UserTasksController < ApplicationController
  before_action :logged_in_user
  before_action :load_user_task, only: :update

  def update
    if @user_task.update user_tasks_params
      flash[:success] = t "controllers.user_tasks_controller.update_success"
      redirect_to request.referrer || root_path
    else
      flash[:danger] = t "controllers.user_tasks_controller.update_failed"
      redirect_to root_path
    end
  end

  private

  def user_tasks_params
    params.require(:user_task).permit :status, :short_description
  end

  def load_user_task
    @user_task = UserTask.find_by id: params[:id]
    return if @user_task
    flash[:danger] = t "controllers.user_tasks_controller.user_task_not_found"
    redirect_to root_path
  end
end
