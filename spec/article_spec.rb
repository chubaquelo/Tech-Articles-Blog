require 'rails_helper'

RSpec.describe 'Article' do
  let(:cat) { Category.create(name: 'CategoryTitle', priority: 0) }
  let(:user) { User.create(name: 'TestName', username: 'testusername', email: 'user@mail.com', password: '123123123') }
  let(:article) { user.articles.create(title: 'TestTitle', body: 'TestBody', category_id: 1) }

  example 'title be TestTitle' do
    expect(article.title).to eq('TestTitle')
  end

  example 'body to be TestBody' do
    expect(article.body).to eq('TestBody')
  end

  example 'category name to be CategoryTitle' do
    expect(cat.name).to eq('CategoryTitle')
  end
end
