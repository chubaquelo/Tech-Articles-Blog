require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'ActiveRecord associations' do
    it 'belongs to User' do
      expect(Article.reflect_on_association(:author).macro).to be (:belongs_to)
    end

    it 'has one category' do
      expect(Article.reflect_on_association(:category).macro).to be (:has_one)
    end
  end
end
