class HomeController < ApplicationController
  def index
    if params[:search]
      search = params[:search]
      response = Faraday.get("https://api.themoviedb.org/3/search/tv?api_key=#{ENV['TMDB_KEY']}&#{search}&language=en-US&page=1&include_adult=false")
      #response = response.body
      #data = JSON.parse(response)
    end
  end

  def privacy
  end

  def tmdb
  end
end
