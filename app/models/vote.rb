class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates_uniqueness_of :user, scope: :article

  scope :most_voted_article, -> { Article.find(group('article_id').count.max_by { |_k, v| v }[0]) }
end
