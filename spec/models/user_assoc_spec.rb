require 'spec_helper'

describe User, type: :model do
  context "ActiveRecord Associations" do
    it { should have_many(:in_follows) }
    it { should have_many(:out_follows) }
    it { should have_many(:followers) }
    it { should have_many(:followees) }
    it { should have_many(:tweets) }
    it { should have_many(:following_tweets) }
  end
end
