json.extract! friendship, :id, :status, :user_id, :friend_id, :created_at, :updated_at
json.url friendship_url(friendship, format: :json)
