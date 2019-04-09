class Admin::SubjectsController < Admin::BaseController
  before_action :logged_in_user, :check_is_trainer
  before_action :load_subject, except: %i(index new create)
  before_action :load_tasks, only: :show

  def index
    @subjects = Subject.newest.paginate page: params[:page],
      per_page: Settings.app.models.subject.subject_per_page
  end

  def new
    @subject = Subject.new
  end

  def show; end

  def edit; end

  def update
    if @subject.update subject_params
      flash[:success] =
        t "admin.controllers.subjects_controller.updated_success"
      redirect_to admin_subjects_path
    else
      render :edit
    end
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] =
        t "admin.controllers.subjects_controller.created_success"
      redirect_to admin_subjects_path
    else
      render :new
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "admin.controllers.subjects_controller.delete_success"
    else
      flash[:danger] = t "admin.controllers.subjects_controller.delete_fail"
    end
    redirect_to admin_subjects_path
  end

  private

  def subject_params
    params.require(:subject).permit :name, :description
  end

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject
    flash[:danger] = t "admin.controllers.subjects_controller.subject_not_found"
    redirect_to admin_subjects_path
  end

  def load_tasks
    @tasks = @subject.tasks.newest.paginate page: params[:page],
      per_page: Settings.app.models.task.tasks_per_page
  end
end
