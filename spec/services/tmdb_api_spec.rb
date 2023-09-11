# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TMDB API Testing' do

  describe '#get_recent_shows' do
    it 'it gets recent shows via get_recent_Shows' do
      hash = TmdbService.new
      recent_shows = hash.get_recent_shows
      expect(recent_shows).not_to eq(nil)
    end
    it 'returns a hash' do
      hash = TmdbService.new
      recent_shows = hash.get_recent_shows
      expect(recent_shows).to be_a(Hash)
    end
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

  it 'gets the season id via get_season_by_id' do
    hash = TmdbService.new
    season = hash.get_season_by_id(66573, 2)
    puts season
    expect(season).to_not eql(nil)
  end

  it 'gets the credits of a show when an ID is provided' do
    hash = TmdbService.new
    credits = hash.get_credits_by_id(66573)
    puts credits
    expect(credits).to_not eql(nil)
  end

  it 'gets shows, tv, movies, and people based on a query' do
    hash = TmdbService.new
    multi_search = hash.multi_search('The Good Place')
    puts multi_search
    expect(multi_search).to_not eql(nil)
  end

  it 'gets person details' do
    hash = TmdbService.new
    person = hash.person_details(1)
    puts person
    expect(person).to_not eql(nil)
  end

  it 'gets person credits (stuff they worked on)' do
    hash = TmdbService.new
    person = hash.person_credits(1)
    puts person
    expect(person).to_not eql(nil)
  end

end