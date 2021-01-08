require 'rails_helper'

RSpec.describe 'Vote create', type: :feature do
  before do
    Category.create(name: 'TestCategory')
    visit new_user_registration_path
    fill_in 'user_name', with: 'Primary'
    fill_in 'user_username', with: 'primaryuser'
    fill_in 'user_email', with: 'primary@user.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    visit new_article_path
    fill_in 'article_title', with: 'Test Article'
    fill_in 'article_body', with: 'Test Body'
    select 'TestCategory', from: 'article_articles_categories_attributes_0_category_id'
    click_on 'Create Article'
    click_on 'Upvote this Article'
    expect(page).to have_content('You voted up this article.')
  end
end
