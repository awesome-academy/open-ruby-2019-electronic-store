class SearchController < ApplicationController
  def index
    if params[:form_search].present?
      @search_products = Product.search_by_name(params[:form_search]).page(params[:page]).per Settings.pages.page_number
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
