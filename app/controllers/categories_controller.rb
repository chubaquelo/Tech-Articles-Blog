class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(:articles).find(params[:id])
    # @articles = Category.find(params[:id]).articles
  end
end
