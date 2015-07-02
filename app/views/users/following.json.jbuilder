json.out_follows @out_follows do |follow|
  json.extract! follow, :id
  json.followee follow.followee.username
end
