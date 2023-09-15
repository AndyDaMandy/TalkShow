# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TMDB API Testing' do

  describe '#get_recent_shows' do
    it 'it gets recent shows via get_recent_Shows' do
      VCR.use_cassette('get_recent_shows') do
        hash = TmdbService.new
        recent_shows = hash.get_recent_shows
        expect(recent_shows['results'].first['name']).to eql("ONE PIECE")
      end
    end
    it 'returns a hash' do
      VCR.use_cassette('get_recent_shows') do
        hash = TmdbService.new
        recent_shows = hash.get_recent_shows
        expect(recent_shows).to be_a(Hash)
      end
    end
  end
  describe '#get_show_by_title' do
    it 'returns an array of shows and the first result is the requested one' do
      VCR.use_cassette('the_good_place') do
        hash = TmdbService.new
        show = hash.get_show_by_title('The Good Place')
        expect(show[0]['name']).to eq('The Good Place')
      end
    end
  end

  describe '#get_shows_by_streaming_service' do
    it 'does not return nil' do
      VCR.use_cassette('get_show_by_streaming_service') do
        hash = TmdbService.new
        shows = hash.get_shows_by_streaming_service('Netflix')
        expect(shows).to_not eql(nil)
      end
    end
  end

  describe '#get_show_by_id' do
    it 'gets show id 66753 when requested' do
      VCR.use_cassette('gets_by_show_id') do
        hash = TmdbService.new
        show = hash.get_show_by_id(66573)
        expect(show['id']).to eq(66573)
      end
    end
  end

  describe '#get_season_by_id' do
    it 'does not return nil' do
      VCR.use_cassette('get_season_by_id_and_number') do
        hash = TmdbService.new
        season = hash.get_season_by_id(66573, 2)
        expect(season).to_not eql(nil)
      end
    end
  end

  describe '#get_credits_by_id' do
    it 'does not equal nil' do
      VCR.use_cassette('get_credits_by_id') do
        hash = TmdbService.new
        credits = hash.get_credits_by_id(66573)
        expect(credits).to_not eql(nil)
      end
    end
  end

  describe '#multi_search' do
    it 'gets shows when queried' do
      VCR.use_cassette('multi_search_show') do
        hash = TmdbService.new
        multi_search = hash.multi_search('The Good Place')
        expect(multi_search).to_not eql(nil)
      end
    end
  end

  describe '#person_details' do
    it 'does not return nil' do
      VCR.use_cassette('person_details') do
        hash = TmdbService.new
        person = hash.person_details(1)
        expect(person).to_not eql(nil)
      end
    end
  end

  describe '#person_credits' do
    it 'does not return nil' do
      VCR.use_cassette('person_credits') do
        hash = TmdbService.new
        person = hash.person_credits(1)
        expect(person).to_not eql(nil)
      end
    end
  end
end
