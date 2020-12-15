class ArticlesController < ApplicationController
  def index
  end
  
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    article = current_user.articles.build(article_params)
    if article.save
      flash[:notice] = 'The article was created succesfully.'
    else
      flash[:notice] = 'Some error ocurred. Try again.'
    end
    redirect_to article_path(article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end