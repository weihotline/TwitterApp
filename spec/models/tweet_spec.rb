require 'spec_helper'

describe Tweet do
  it "should fail validation with no content" do
    tweet = Tweet.new
    expect(tweet).to_not be_valid
  end
end
