require 'json'
class HomeController < ApplicationController
  def index
    if params[:search]
    #  search = params[:search]
    hash = TmdbService.new
    @data = hash.get_show_by_title(params[:search])
    #if response body 1== @data = "thi doesn't work"
    end
  end

  def privacy
  end

  def tmdb
  end
end
