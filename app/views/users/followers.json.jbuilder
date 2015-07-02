json.in_follows @in_follows do |follow|
  json.extract! follow, :id
  json.follower follow.follower.username
end
