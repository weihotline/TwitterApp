require 'spec_helper'

describe Follow, type: :model do

  before(:all) do
    @user = User.create!(email: "jc@example.com", username: "John", password: "good-password")
  end

  after(:all) do
    User.last.destroy
  end

  it "::self_follow" do
    expect(Follow.self_follow(@user)).to be_valid
  end

  it "::find_out_follows_by_user" do
    expect(Follow.find_out_follows_by_user(@user)).to be_empty
  end

  it "::find_in_follows_by_user" do
    expect(Follow.find_in_follows_by_user(@user)).to be_empty
  end

  it "should fail validations with empty attributes" do
    follow = Follow.new
    expect(follow).to_not be_valid
    expect(follow).to have(1).error_on(:followee)
    expect(follow.errors.messages[:followee]).to include 'can\'t be blank'
    expect(follow).to have(1).error_on(:follower)
    expect(follow.errors.messages[:follower]).to include 'can\'t be blank'
  end

  it { should belong_to(:follower) }
  it { should belong_to(:followee) }
end
