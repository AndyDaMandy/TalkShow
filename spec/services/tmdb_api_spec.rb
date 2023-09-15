# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TMDB API Testing' do

  describe '#get_recent_shows' do
    it 'it gets recent shows via get_recent_Shows' do
      # stub_request(:get, "https://api.themoviedb.org/3/trending/tv/week?api_key=#{ENV['TMDB_API']}")
      #   .with(
      #     headers: {
      #       'Accept' => '*/*',
      #       'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #       'User-Agent' => 'Faraday v2.7.4'
      #     }
      #   )
      #   .to_return(status: 200, body: '', headers: {})

      VCR.use_cassette('get_recent_shows') do
        hash = TmdbService.new
        recent_shows = hash.get_recent_shows
        expect(recent_shows['results'].first['name']).to eql("ONE PIECE")
      end
      # hash = TmdbService.new
      # recent_shows = hash.get_recent_shows
      # expect(recent_shows).to_not eql(nil)
    end
    it 'returns a hash' do
      hash = TmdbService.new
      recent_shows = hash.get_recent_shows
      expect(recent_shows).to be_a(Hash)
    end
  end

  it 'gets the show by title via get_show_by_title' do
    VCR.use_cassette('the_good_place') do
      hash = TmdbService.new
      show = hash.get_show_by_title('The Good Place')
      expect(show[0]['name']).to eq('The Good Place')
    end
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