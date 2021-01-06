class Category < ApplicationRecord
  has_many :articles_categories
  has_and_belongs_to_many :articles, :through => :articles_categories
  validates_presence_of :name
end
