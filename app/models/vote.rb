class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates_uniqueness_of :user, scope: :article
end
