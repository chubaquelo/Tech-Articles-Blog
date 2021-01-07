require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'ActiveRecord associations' do
    it 'has many articles' do
      expect(Category.reflect_on_association(:articles).macro).to be(:has_and_belongs_to_many)
    end

    it 'do not belongs to article' do
      expect(Category.reflect_on_association(:articles).macro).not_to be(:belongs_to)
    end
  end
end
