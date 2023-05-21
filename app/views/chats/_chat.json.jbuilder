json.extract! chat, :id, :recommend_id, :user_id, :friend_id, :message, :created_at, :updated_at
json.url chat_url(chat, format: :json)
