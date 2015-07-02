json.array! @in_follows do |follow|
  follower = follow.follower

  json.id follower.id
  json.username follower.username

  @follows.each do |follow_id, followee_id|
    if followee_id == follower.id
      json.beingFollowed true
      json.followId follow_id
    end
  end
end
