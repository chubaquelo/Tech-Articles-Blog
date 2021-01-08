class AddCategoryIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :category, foreign_key: true
  end
end
