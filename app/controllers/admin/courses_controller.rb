class Admin::CoursesController < Admin::BaseController
  before_action :logged_in_user, :check_is_admin
  before_action :load_course, except: %i(index new create)

  def index
    @courses = Course.newest.paginate page: params[:page],
      per_page: Settings.app.models.course.course_per_page
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t "admin.controllers.courses_controller.add_success"
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @course.update course_params
      flash[:success] = t "admin.controllers.courses_controller.update_success"
      redirect_to admin_courses_path
    else
      render :edit
    end
  end

  def destroy
    if @course.destroy
      flash[:success] = "admin.controllers.courses_controller.delete_success"
    else
      flash[:danger] = "admin.controllers.courses_controller.delete_fail"
    end
    redirect_to admin_courses_path
  end

  private

  def course_params
    params.require(:course).permit :name, :description, :image, :start_date,
      :end_date
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "admin.controllers.courses_controller.course_not_found"
    redirect_to admin_courses_path
  end
end
