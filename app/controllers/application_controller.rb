class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def load_user
    @user = User.find_by id: params[:id]

    return if @user

    flash[:danger] = t "page.signup.not_found"
    redirect_to root_path
  end
end
