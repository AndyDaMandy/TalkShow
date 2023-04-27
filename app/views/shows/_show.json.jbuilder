json.extract! show, :id, :tmdb_id, :origin_country, :original_language, :original_name, :overview, :poster_path, :first_air_date, :name, :created_at, :updated_at
json.url show_url(show, format: :json)
