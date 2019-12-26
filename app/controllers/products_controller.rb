class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per Settings.pages.page_number
  end

  def show
    @product = Product.find_by id: params[:id]

    return if @product

    flash[:danger] = t "page.signup.not_found"
    redirect_to root_path
  end
end
