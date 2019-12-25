class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per Settings.pages.page_number
  end
end
