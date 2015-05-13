require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have a name" do
    user = FactoryGirl.build_stubbed(:user, name: nil)
    expect(user).to be_invalid
  end

  it "should have a name of length <= 50 characters" do
    user1 = FactoryGirl.build_stubbed(:user, email: "user@example.com", name: "12345678901234567890123456789012345678901234567890")
    user2 = FactoryGirl.build_stubbed(:user, email: "usar@example.com", name: "123456789012345678901234567890123456789012345678901")
    expect(user1).to be_valid
    expect(user2).to be_invalid
  end

  it "should have a username" do
    user = FactoryGirl.build_stubbed(:user, username: nil)
    expect(user).to be_invalid
  end

  it "should have a username of length 3-20 characters" do
    user1 = FactoryGirl.build_stubbed(:user, email: "user@example.com", username: "12")
    user2 = FactoryGirl.build_stubbed(:user, email: "usar@example.com", username: "1234567890")
    user3 = FactoryGirl.build_stubbed(:user, email: "usor@example.com", username: "123456789012345678901")
    expect(user1).to be_invalid
    expect(user2).to be_valid
    expect(user3).to be_invalid
  end

  it "should have a unique username" do
    user = FactoryGirl.create(:user, email: "Richard@example.com", username: "Richard")
    user2 = FactoryGirl.build_stubbed(:user, username: "RICHARD")
    expect(user2).to be_invalid
  end

  it "should have an email" do
    user = FactoryGirl.build_stubbed(:user, email: nil)
    expect(user).to be_invalid
  end

  it "should have an email of length <= 100 characters" do
    user1 = FactoryGirl.build_stubbed(:user, email: "123456789012345678901234567890123456789012345678901234567890123456789012345678901234user@example.com")
    user2 = FactoryGirl.build_stubbed(:user, email: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345user@example.com")
    expect(user1).to be_valid
    expect(user2).to be_invalid
  end

  it "should have an email of valid format" do
    user1 = FactoryGirl.build_stubbed(:user, email: "hello@example")
    user2 = FactoryGirl.build_stubbed(:user, email: "hello.com")
    user3 = FactoryGirl.build_stubbed(:user, email: "@example.com")
    expect(user1).to be_invalid
    expect(user2).to be_invalid
    expect(user3).to be_invalid
  end

  it "should have a unique email" do
    user1 = FactoryGirl.create(:user, email: "user@example.com")
    user2 = FactoryGirl.build_stubbed(:user, email: "user@example.com")
    expect(user2).to be_invalid
  end

  it "should have a password" do
    user = FactoryGirl.build_stubbed(:user, password: nil)
    expect(user).to be_invalid
  end

  it "should have matching password and confirmation" do
    user = FactoryGirl.build_stubbed(:user, password: "123qwe", password_confirmation: "123456")
    expect(user).to be_invalid
  end

  it "should have a password length of 6-50 characters" do
    pass51char = "123456789012345678901234567890123456789012345678901"
    user1 = FactoryGirl.build_stubbed(:user, password: "12345", password_confirmation: "12345")
    user2 = FactoryGirl.build_stubbed(:user, password: pass51char, password_confirmation: pass51char)
    expect(user1).to be_invalid
    expect(user2).to be_invalid
  end
end
