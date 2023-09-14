require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
    serialize_with: :json
  }
  c.filter_sensitive_data('<API_KEY>') { ENV['TMDB_KEY'] }
end
