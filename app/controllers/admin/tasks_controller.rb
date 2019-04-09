class Admin::TasksController < Admin::BaseController
  before_action :logged_in_user, :check_is_trainer
  before_action :load_task, only: %i(destroy edit update)

  def create
    @task = Task.new task_params
    if @task.save
      flash[:success] = t "admin.controllers.tasks_controller.created_success"
    else
      flash[:danger] = @task.errors.full_messages.join(", ")
    end
    redirect_to admin_subject_path @task.subject_id
  end

  def destroy
    if @task.destroy
      flash[:success] = t "admin.controllers.tasks_controller.delete_success"
    else
      flash[:danger] = t "admin.controllers.tasks_controller.delete_fail"
    end
    redirect_to admin_subject_path @task.subject_id
  end

  def edit; end

  def update
    if @task.update task_params
      flash[:success] = t "admin.controllers.tasks_controller.update_success"
      redirect_to admin_subject_path @task.subject_id
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit :name, :description, :subject_id
  end

  def load_task
    @task = Task.find_by id: params[:id]
    return if @task
    flash[:danger] = t "admin.controllers.tasks_controller.task_not_found"
    redirect_to admin_subjects_path
  end
end
