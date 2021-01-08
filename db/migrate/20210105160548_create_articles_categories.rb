class CreateArticlesCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_categories do |t|
      t.references :article, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end
