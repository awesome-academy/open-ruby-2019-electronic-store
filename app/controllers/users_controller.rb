class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(show new create)
  before_action :load_user, only: %i(show edit update destroy)
  before_action :admin_user, only: :destroy

  def index
    @users = User.page(params[:page]).per Settings.pages.page_number
  end

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

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "page.update.success"
      redirect_to @user
    else
      flash[:danger] = t "page.update.failed"
      render :edit
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

  def admin_user
    return if current_user.admin?
    redirect_to root_url 
  end
end
