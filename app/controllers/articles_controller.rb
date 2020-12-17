class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
    @last_articles = @categories.map { |cat| cat.articles.last }
    @main_article = Vote.most_voted_article
  end

  def show
    @article = Article.includes(:votes, :category).find(params[:id])
  end

  def new
    @article = current_user.articles.build
    @categories = Category.all.map { |category| [category.name, category.id] }
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:notice] = 'The article was created succesfully.'
      redirect_to article_path(@article.id)
    else
      flash[:notice] = 'Some error ocurred. Try again.'
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :category_id, :image)
  end
end
