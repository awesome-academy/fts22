class UserTasksController < ApplicationController
  before_action :load_user_task, only: %i(edit update)

  def create
    @user_task = UserTask.new user_tasks_params
    @user_task.status = UserTask.statuses[:in_progress]
    if @user_task.save
      @success_adding_message =
        t "controllers.user_tasks_controller.pick_task_success"
      load_unpicked_tasks params[:course_subject]
      load_picked_tasks
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

  def load_course_subject course_subject_id
    @course_subject = CourseSubject.find_by id: course_subject_id
    return if @course_subject
    flash[:danger] =
      t "controllers.user_tasks_controller.course_subject_not_found"
    redirect_to root_path
  end

  def load_unpicked_tasks course_subject_id
    load_course_subject course_subject_id
    @unpicked_tasks = @course_subject.tasks.except_task_ids(
      current_user.user_tasks.pluck(:task_id)
    )
  end

  def load_picked_tasks
    @picked_tasks = current_user.user_tasks.by_tasks_id(
      Task.by_course_subject_id(@course_subject.id).pluck(:id)
    )
  end

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
