json.extract! season, :id, :name, :content_id, :season_number, :episode_count, :air_date, :overview, :poster_path, :created_at, :updated_at
json.url season_url(season, format: :json)
