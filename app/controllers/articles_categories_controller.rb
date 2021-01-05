class ArticlesCategoriesController < ApplicationController
  def new
    @categorization = Categorization.new
  end

  def create
    @categorization = Categorization.build(categorization_params)

    if @categorization.save
      flash[:notice] = 'The categorization was created succesfully.'
      redirect_to 'root'
    else
      flash[:notice] = 'Some error ocurred. Try again.'
      render 'root'
    end
  end

  private

  def categorization_params
    params.require(:categorizations).permit(:category_id, :article_id)
  end
end
