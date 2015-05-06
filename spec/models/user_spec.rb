require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid without a name" do
    user = FactoryGirl.build_stubbed(:user, name: nil)
    expect(user).to be_invalid
  end

  it "is invalid without a username" do
    user = FactoryGirl.build_stubbed(:user, username: nil)
    expect(user).to be_invalid
  end

  it "is invalid if username is not unique" do
    user = FactoryGirl.create(:user, email: "Richard@example.com", username: "Richard")
    user2 = FactoryGirl.build_stubbed(:user, username: "Richard")
    expect(user2).to be_invalid
  end

  it "is invalid if username is not between 3-16 characters" do
    user = FactoryGirl.build_stubbed(:user, username: "12")
    user2 = FactoryGirl.build_stubbed(:user, email: "dug@example.net", username: "12345678901234567")
    expect(user).to be_invalid
    expect(user2).to be_invalid
  end

  it "is invalid if username is in the wrong format"

  it "is invalid without an email" do
    user = FactoryGirl.build_stubbed(:user, email: nil)
    expect(user).to be_invalid
  end

  it "is invalid if email is not unique" do
    user = FactoryGirl.create(:user, username: "user1", email: "Richard@example.com")
    user2 = FactoryGirl.build_stubbed(:user, username: "user2", email: "Richard@example.com")
    expect(user2).to be_invalid
  end

  it "is invalid if email is in the wrong format" do
    user = FactoryGirl.build_stubbed(:user, email: "Richard@example")
    expect(user).to be_invalid
  end

  it "is invalid without a password"

  it "is invalid unless password is 6-20 characters"

  it "is invalid without correct password confirmation" 
end
