class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates_uniqueness_of :user, scope: :article

  scope :most_voted_article, -> { Article.find(group("article_id").count.sort_by {|k, v| v }.last[0]) }

end
