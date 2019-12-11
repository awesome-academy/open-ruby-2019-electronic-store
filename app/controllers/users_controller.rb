class UsersController < ApplicationController
  before_action :load_user, only: %i(show destroy)

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      flash[:success] = t "page.signup.success"
      redirect_to login_path
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("page.delete.success")
    else
      flash[:danger] = t("page.delete.failed")
    end
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end
end
