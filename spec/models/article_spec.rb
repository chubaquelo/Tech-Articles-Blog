require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'ActiveRecord associations' do
    it 'belongs to User' do
      expect(Article.reflect_on_association(:author).macro).to be(:belongs_to)
    end

    it 'does not have many authors' do
      expect(Article.reflect_on_association(:author).macro).not_to be(:has_many)
    end

    it 'has belongs to many category' do
      expect(Article.reflect_on_association(:categories).macro).to be(:has_and_belongs_to_many)
    end

    it 'has many votes' do
      expect(Article.reflect_on_association(:votes).macro).to be(:has_many)
    end

    it 'does not has_one vote' do
      expect(Article.reflect_on_association(:votes).macro).not_to be(:has_one)
    end
  end
end
