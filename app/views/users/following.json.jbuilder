json.array! @out_follows do |follow|
  followee = follow.followee

  json.followId follow.id
  json.id followee.id
  json.username followee.username
  json.beingFollowed true
end
