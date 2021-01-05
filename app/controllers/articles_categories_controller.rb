class ArticlesCategoriesController < ApplicationController
  def new
    @categorization = ArticlesCategory.new
  end

  def create
    @categorization = ArticlesCategory.build(articles_categories_params)

    if @categorization.save
      flash[:notice] = 'The categorization was created succesfully.'
      redirect_to 'root'
    else
      flash[:notice] = 'Some error ocurred. Try again.'
      render 'root'
    end
  end

  private

  def articles_categories
    params.require(:articles_categories).permit(:category_id, :article_id)
  end
end
