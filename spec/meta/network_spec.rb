require 'rails_helper'

RSpec.describe 'meta' do
  describe 'truth' do
    it 'is true' do
      expect(true).to be(true)
    end
  end
  describe 'network' do
    it 'is behind VCR' do
      expect{Faraday.get('http://www.iana.org/domains/reserved')}.to raise_error(VCR::Errors::UnhandledHTTPRequestError)
    end
    it 'can be recorded by VCR' do
      VCR.use_cassette('meta') do
        response = Faraday.get('http://www.iana.org/domains/reserved')
        expect(response.body.include?('IANA')).to be(true)
      end
    end
  end
end