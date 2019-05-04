class Trainer::UserCoursesController < Trainer::BaseController
  before_action :load_user_course, only: :destroy

  def create
    @user_course = UserCourse.new user_course_params
    if @user_course.save
      @success_adding_message =
        t "trainer.controllers.user_courses_controller.created_success"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    if @user_course.destroy
      @delete_success_message =
        t "trainer.controllers.user_courses_controller.delete_success"
    else
      @delete_fail_message =
        t "trainer.controllers.user_courses_controller.delete_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def user_course_params
    params.require(:user_course).permit :user_id, :course_id
  end

  def load_user_course
    @user_course = UserCourse.find_by id: params[:id]
    return if @user_course
    flash[:danger] = t "trainer.controllers.user_courses_controller.not_found"
    redirect_to request.referrer || root_path
  end
end
