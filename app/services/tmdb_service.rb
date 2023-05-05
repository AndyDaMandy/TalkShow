# frozen_string_literal: true

require 'faraday'
require 'json'
# Service for connecting to the Tmdb Api
class TmdbService
  # BASE_URL = 'https://api.themoviedb.org/3/'
  def get_show_by_title(query)
    response = Faraday.get("https://api.themoviedb.org/3/search/tv?api_key=#{ENV['TMDB_KEY']}&query=#{query}")
    return unless response.status == 200

    JSON.parse(response.body)['results']

  end

  def get_shows_by_streaming_service(query)
    response = Faraday.get("https://api.themoviedb.org/3/search/company?api_key=#{ENV['TMDB_KEY']}&query=#{query}")
    return unless response.status == 200

    JSON.parse(response.body)

  end

  # quick note, so the idea here is once you pull the show you then have the season number. I'll then create buttons that call the season list and THEN you can add that to your Seasons. You can then review the show or the season. THAT's IT
  def get_show_by_id(query)
    response = Faraday.get("https://api.themoviedb.org/3/tv/#{query}?api_key=#{ENV['TMDB_KEY']}")
    return unless response.status == 200

    JSON.parse(response.body)

  end

  def get_season_by_id(tv_id, season_num)
    response = Faraday.get("https://api.themoviedb.org/3/tv/#{tv_id}/season/#{season_num}?api_key=#{ENV['TMDB_KEY']}")
    return unless response.status == 200

    JSON.parse(response.body)

  end

end
