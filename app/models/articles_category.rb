class ArticlesCategory < ApplicationRecord
  belongs_to :article
  belongs_to :category
  validates_presence_of :category_id, :article_id
end
