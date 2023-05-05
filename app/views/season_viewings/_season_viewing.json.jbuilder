json.extract! season_viewing, :id, :tmdb_id, :content_id, :show_id, :user_id, :viewing_id, :status, :note, :progress, :created_at, :updated_at
json.url season_viewing_url(season_viewing, format: :json)
