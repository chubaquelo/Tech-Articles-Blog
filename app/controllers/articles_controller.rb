class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @categories = Category.all
    @main_article = Vote.most_voted_article
    # @city = request.location.city
  end

  def show
    @article = Article.includes(:votes).find(params[:id])
  end

  def new
    @article = current_user.articles.build
    @article.articles_categories.build
    @categories = Category.all.map { |category| [category.name, category.id] }
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:notice] = 'The article was created succesfully.'
      redirect_to article_path(@article.id)
    else
      flash[:notice] = 'All fields must be completed (only image is optional). Try again.'
      redirect_to new_article_path
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :image, articles_categories_attributes: [:category_id])
  end
end
