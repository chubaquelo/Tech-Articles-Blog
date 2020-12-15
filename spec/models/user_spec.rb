require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveRecord associations' do
    it 'has many articles' do
      expect(User.reflect_on_association(:articles).macro).to be (:has_many)
    end
  end
end
