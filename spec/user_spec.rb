require 'rails_helper'

RSpec.describe 'User' do
  let(:user) { User.create(name: 'TestName', username: 'testusername', email: 'user@mail.com', password: '123123123') }
  example 'name be TestName' do
    expect(user.name).to eq('TestName')
  end

  example 'username be testusername' do
    expect(user.username).to eq('testusername')
  end

  example 'email be user@mail.com' do
    expect(user.email).to eq('user@mail.com')
  end

  example 'password be 123123123' do
    expect(user.password).to eq('123123123')
  end
end
