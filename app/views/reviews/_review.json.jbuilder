json.extract! review, :id, :rating, :recommend, :content, :viewing_id, :show_id, :movie_id, :created_at, :updated_at
json.url review_url(review, format: :json)
