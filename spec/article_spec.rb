require 'rails_helper'

RSpec.describe 'Article' do
  let(:cat) { Category.create(name: 'CategoryTitle', priority: 0) }
  let(:user) { User.create(name: 'TestName', username: 'testusername', email: 'user@mail.com', password: '123123123') }
  let(:article) { Article.create(title: 'TestTitle', body: 'TestBody', author_id: user.id) }
  let(:categorization) { ArticlesCategory.create(article_id: article.id, category_id: cat.id) }

  example 'title be TestTitle' do
    expect(article.title).to eq('TestTitle')
  end

  example 'title not to be Other thing' do
    expect(article.title).not_to eq('Other thing')
  end

  example 'body to be TestBody' do
    expect(article.body).to eq('TestBody')
  end

  example 'body to not be Other thing' do
    expect(article.body).not_to eq('Other thing')
  end

  example 'category name to be CategoryTitle' do
    expect(cat.name).to eq('CategoryTitle')
  end

  example 'category name to not be SomeTitle' do
    expect(cat.name).not_to eq('SomeTitle')
  end
end
