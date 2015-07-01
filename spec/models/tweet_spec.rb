require 'spec_helper'

describe Tweet do
  let(:user) do
    stub_model User, email: "jc@example.com", username: "JC"
  end

  it "should fail validation with no content" do
    tweet = Tweet.new
    expect(tweet).to_not be_valid
  end

  it "should be valid with content" do
    expect(Tweet.new(content: "This is a tweet!")).to be_valid
  end

  it "should have no following tweets for new user" do
    expect(Tweet.find_all_following_tweets_by_user(user)).to be_empty
  end
end
