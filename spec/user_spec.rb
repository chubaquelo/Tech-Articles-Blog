require 'rails_helper'

RSpec.describe 'User' do
  let(:user) { User.create(name: 'TestName', username: 'testusername', email: 'user@mail.com', password: '123123123') }
  example 'name be TestName' do
    expect(user.name).to eq('TestName')
  end

  example 'name not to be John' do
    expect(user.name).not_to eq('John')
  end

  example 'username be testusername' do
    expect(user.username).to eq('testusername')
  end

  example 'username not to be username' do
    expect(user.username).not_to eq('username')
  end

  example 'email be user@mail.com' do
    expect(user.email).to eq('user@mail.com')
  end

  example 'email not to be useruser@mail.com' do
    expect(user.email).not_to eq('useruser@mail.com')
  end

  example 'password be 123123123' do
    expect(user.password).to eq('123123123')
  end

  example 'password not to be 321321321' do
    expect(user.password).not_to eq('321321321')
  end
end
