class Trainer::TraineesController < Trainer::BaseController
  before_action :load_courses, only: %i(new create)
  before_action :load_trainee, only: %i(edit update destroy)

  def index
    @trainees = User.trainee.newest.paginate page: params[:page],
      per_page: Settings.app.users.users_per_page
  end

  def new
    @trainee = User.new
  end

  def edit; end

  def update
    if @trainee.update_attributes trainee_params
      flash[:success] =
        t "trainer.controllers.trainees_controller.updated_success"
      redirect_to trainer_trainees_path
    else
      render :edit
    end
  end

  def create
    @trainee = User.new trainee_params
    @trainee.role = User.roles[:trainee]
    @trainee.password = generate_password
    ActiveRecord::Base.transaction do
      @trainee.save!
      adding_to_course @trainee, params[:course] unless params[:course].blank?
      notify_by_mail @trainee
    rescue ActiveRecord::RecordInvalid
      render :new
    end
  end

  def destroy
    if @trainee.destroy
      flash[:success] =
        t "trainer.controllers.trainees_controller.deleted_success"

    else
      flash[:danger] =
        t "trainer.controllers.trainees_controller.deleted_fail"
    end
    redirect_to trainer_trainees_path
  end

  private

  def trainee_params
    params.require(:user).permit :name, :email
  end

  def load_courses
    @courses = Course.open
  end

  def load_trainee
    @trainee = User.find_by id: params[:id]
    return if @trainee
    flash[:danger] =
      t "trainer.controllers.trainees_controller.trainee_not_found"
    redirect_to trainer_trainees_path
  end

  def generate_password
    SecureRandom.hex Settings.app.models.user.default_password_lenght
  end

  def notify_by_mail trainee
    trainee.send_created_email
    flash[:success] =
      t "trainer.controllers.trainees_controller.created_success"
    redirect_to trainer_trainees_path
  end

  def adding_to_course trainee, course_id
    UserCourse.create! user_id: trainee.id, course_id: course_id
    course = Course.find_by id: course_id
    unless course
      flash[:danger] =
        t "trainer.controllers.trainees_controller.course_not_found"
      redirect_to trainer_trainees_path
    end
    trainee.send_assigned_course_email course
  end
end
