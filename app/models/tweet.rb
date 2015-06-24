class Tweet < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :author_id

  def self.find_all_following_tweets_by_user(user)
    user.following_tweets.order(updated_at: :desc)
  end
end
