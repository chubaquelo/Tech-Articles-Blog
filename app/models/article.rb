class Article < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User', dependent: :destroy
  has_many :articles_categories
  has_and_belongs_to_many :categories, through: :articles_categories
  has_many :votes, dependent: :destroy
  has_one_attached :image

  validate :acceptable_image
  validates_presence_of :title, :body

  accepts_nested_attributes_for :articles_categories

  def self.most_voted
    Article.order(votes: :desc).first
  end

  private

  def acceptable_image
    return unless image.attached?

    errors.add(:main_image, 'is too big') unless image.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:main_image, 'must be a JPEG or PNG') unless acceptable_types.include?(image.content_type)
  end
end
