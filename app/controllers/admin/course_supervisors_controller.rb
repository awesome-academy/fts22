class Admin::CourseSupervisorsController < Admin::BaseController
  before_action :load_course_supervisor, only: :destroy

  def create
    @course_supervisor = CourseSupervisor.new course_supervisor_params
    if @course_supervisor.save
      @success_adding_message =
        t "admin.controllers.course_supervisors_controller.created_success"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @course_supervisor.destroy
      @delete_message =
        t "admin.controllers.course_supervisors_controller.delete_success"
    else
      @delete_message =
        t "admin.controllers.course_supervisors_controller.delete_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def course_supervisor_params
    params.require(:course_supervisor).permit :user_id, :course_id
  end

  def load_course_supervisor
    @course_supervisor = CourseSupervisor.find_by id: params[:id]
    return if @course_supervisor
    flash[:danger] =
      "admin.controllers.course_supervisors_controller.supervisor_not_found"
    redirect_to request.referrer || root_path
  end
end
