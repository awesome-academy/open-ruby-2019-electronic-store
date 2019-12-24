class CategoriesController < ApplicationController
  before_action :load_category, only: :show

  def index
    @category = Category.page(params[:page]).per Settings.pages.page_number
  end

  def show
    @products = @category.products.page params[:page]
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    if @category.present?
      @title = @category.name
    else
      flash[:danger] = t "page.signup.not_found"
      redirect_to root_path
    end
  end
end
