class Follow < ActiveRecord::Base
  validates :followee, :follower, presence: true
  validates :follower, uniqueness: { scope: :followee }

  belongs_to :followee, class_name: "User", foreign_key: :followee_id
  belongs_to :follower, class_name: "User", foreign_key: :follower_id

  def self.self_follow(user)
    Follow.create!(followee_id: user.id, follower_id: user.id)
  end
end
