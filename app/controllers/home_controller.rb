# frozen_string_literal: true

require 'json'

# holds non-saved data
class HomeController < ApplicationController

  def index
    hash = TmdbService.new
    @recent_shows = hash.get_recent_shows

    return unless params[:search]

    #  search = params[:search]
    # hash = TmdbService.new
    @data = hash.get_show_by_title(params[:search])
    # if response body 1== @data = "thi doesn't work"

  end

  def show
    hash = TmdbService.new
    @data = hash.get_show_by_id(params[:tmdb_id])
    @providers = hash.get_watch_providers_by_id(params[:tmdb_id])
    @credits = hash.get_credits_by_id(params[:tmdb_id])
  end

  def season
    hash = TmdbService.new
    # @show = hash.get_show_by_id(params[:tmdb_id])
    @data = hash.get_season_by_id(params[:tmdb_id], params[:season_number])
  end

  def privacy
  end

  def tmdb
  end
end
