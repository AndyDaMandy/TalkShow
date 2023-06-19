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
    @data = hash.multi_search(params[:search])
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

  def feed
    # TODO: Add in content for users. Pull all users or just friends?
    # Since it's user based well pull recent actions
    # Recent actions would be recently added shows or recently liked content?
    # We'll try a version with just all users for now
    # @friends = current_user.friends
    # @viewings = @friends.viewings
    # @reviews = @friends.reviews
    # @content = @viewings + @reviews
    # @users = User.all
    @reviews = Review.all
    @viewings = Viewing.all
    @content = @viewings.to_a + @reviews.to_a
    @content = @content.sort_by {|obj| obj.created_at }.reverse
  end

  def privacy
  end

  def tmdb
  end

  def people
    hash = TmdbService.new

    @person = hash.person_details(params[:tmdb_id])
    @credits = hash.person_credits(params[:tmdb_id])
  end

end
