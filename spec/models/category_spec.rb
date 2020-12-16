require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'ActiveRecord associations' do
    it 'has many articles' do
      expect(Category.reflect_on_association(:articles).macro).to be(:has_many)
    end
  end
end
