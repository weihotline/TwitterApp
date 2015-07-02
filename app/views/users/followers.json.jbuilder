json.array! @in_follows do |follow|
  follower = follow.follower

  json.followId follow.id
  json.id follower.id
  json.username follower.username
end
