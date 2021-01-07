require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveRecord associations' do
    it 'has many articles' do
      expect(User.reflect_on_association(:articles).macro).to be(:has_many)
    end

    it 'does not has just one article' do
      expect(User.reflect_on_association(:articles).macro).not_to be(:has_one)
    end

    it 'has many votes' do
      expect(User.reflect_on_association(:votes).macro).to be(:has_many)
    end

    it 'does not has_one vote' do
      expect(User.reflect_on_association(:votes).macro).not_to be(:has_one)
    end
  end
end
