# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'TMDB API Testing' do

  describe 'TMDB API Methods' do

    it 'it gets recent shows via get_recent_Shows' do
      hash = TmdbService.new
      recent_shows = hash.get_recent_shows
      expect(recent_shows).not_to eq(nil)
    end

    it 'gets the show by title via get_show_by_title' do
      hash = TmdbService.new
      show = hash.get_show_by_title('The Good Place')
      puts show
      expect(show[0]['name']).to eq('The Good Place')
    end

    it 'gets the show by streaming service via get_shows_by_streaming_service' do
      hash = TmdbService.new
      shows = hash.get_shows_by_streaming_service('Netflix')
      puts shows
      expect(shows).to_not eql(nil)
    end

    it 'gets the show by id via get_show_by_id' do
      hash = TmdbService.new
      show = hash.get_show_by_id(66573)
      puts show
      expect(show['id']).to eq(66573)
    end

  end


end