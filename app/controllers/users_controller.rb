class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update]

  def show; end
  
  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash.now[:success] = t "controllers.users_controller.profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
  end

  def load_user
    @user = User.find_by(id: params[:id])
    return if @user
    flash[:danger] = t "controllers.users_controller.user_not_found"
    redirect_to root_path
  end
end
