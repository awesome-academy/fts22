class Trainer::TasksController < Trainer::BaseController
  before_action :load_task, only: %i(destroy update)

  def create
    @task = Task.new task_params
    if @task.save
      @add_message = t "trainer.controllers.tasks_controller.add_success"
      load_tasks
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @delete_message =
      if @task.destroy
        t "trainer.controllers.tasks_controller.delete_success"
      else
        t "trainer.controllers.tasks_controller.delete_failed"
      end
    load_tasks
    respond_to do |format|
      format.js
    end
  end

  def update
    if @task.update task_params
      @edit_message = t "trainer.controllers.tasks_controller.edit_success"
      load_tasks
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit :name, :description, :course_subject_id
  end

  def load_task
    @task = Task.find_by id: params[:id]
    return if @task
    flash[:danger] = t "trainer.controllers.tasks_controller.not_found"
    redirect_to root_path
  end

  def load_tasks
    @tasks =
      @task.course_subject.tasks.order_by_name.paginate page: params[:page],
      per_page: Settings.app.tasks.tasks_per_page
  end
end
