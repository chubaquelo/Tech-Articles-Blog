class Article < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :category
  has_many :votes
  has_one_attached :image

  validate :acceptable_image
  validates_presence_of :title, :body, :category

  private

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 1.megabyte
      errors.add(:main_image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:main_image, "must be a JPEG or PNG")
    end
  end
end
