json.author current_user.username

json.extract! @tweet, :content, :updated_at
