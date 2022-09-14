require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Create an User with an invalid email " do
    it "shouldn't be permitted" do
      user = User.create(
                   email: 'user',
                   password: 'password1234',
                   username: 'user')
      expect(user).to_not be_valid
    end
  end

  describe "Create an User with an invalid password shorter than 8 characters" do
    it "shouldn't be permitted" do
      user = User.create(
                   email: 'user@gmail.com',
                   password: 'pas',
                   username: 'user')
      expect(user).to_not be_valid
    end
  end

  describe "Create an User without an email " do
    it "shouldn't be permitted" do
      user = User.create(
                   email: nil,
                   password: 'password1234',
                   username: 'user')
      expect(user).to_not be_valid
    end
  end

  describe "Create an User without a password " do
    it "shouldn't be permitted" do
      user = User.create(
                   email: 'user@gmail.com',
                   password: nil,
                   username: 'user')
      expect(user).to_not be_valid
    end
  end

  describe "Create an User with password and password_confirmation with different values" do
    it "shouldn't be permitted" do
      user = User.create(
                   email: 'user@gmail.com',
                   username:  'user',
                   password: 'hello', 
                   password_confirmation: 'password1234')
      expect(user).to_not be_valid
    end
  end

  describe "Create an User with a valid email and password " do
    it "should be permitted" do
      user = User.create(
                    email: 'user@gmail.com', 
                    username: 'user',
                    password: 'password1234')
      expect(user).to be_valid
    end
  end

end
