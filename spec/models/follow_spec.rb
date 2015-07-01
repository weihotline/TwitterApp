require 'spec_helper'

describe Follow do
  it "should fail validations with empty attributes" do
    follow = Follow.new
    expect(follow).to_not be_valid
    expect(follow).to have(1).error_on(:followee)
    expect(follow.errors.messages[:followee]).to include 'can\'t be blank'
    expect(follow).to have(1).error_on(:follower)
    expect(follow.errors.messages[:follower]).to include 'can\'t be blank'
  end

  it "::self_follow" do
    user = User.create!(email: "jc@example.com", username: "John", password: "good-password")
    expect(Follow.self_follow(user)).to be_valid
  end
end
