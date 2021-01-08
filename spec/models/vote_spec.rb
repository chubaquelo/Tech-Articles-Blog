require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'ActiveRecord associations' do
    it 'belongs to articles' do
      expect(Vote.reflect_on_association(:article).macro).to be(:belongs_to)
    end

    it 'belongs to users' do
      expect(Vote.reflect_on_association(:user).macro).to be(:belongs_to)
    end
  end
end
