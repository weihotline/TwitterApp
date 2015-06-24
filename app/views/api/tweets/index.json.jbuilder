json.tweets @tweets do |tweet|
  json.extract! tweet, :id, :content, :updated_at
  json.author tweet.author.username
end
