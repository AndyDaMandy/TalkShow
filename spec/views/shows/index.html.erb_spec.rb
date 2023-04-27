require 'rails_helper'

RSpec.describe "shows/index", type: :view do
  before(:each) do
    assign(:shows, [
      Show.create!(
        tmdb_id: "Tmdb",
        origin_country: "Origin Country",
        original_language: "Original Language",
        original_name: "Original Name",
        overview: "Overview",
        poster_path: "Poster Path",
        first_air_date: "First Air Date",
        name: "Name"
      ),
      Show.create!(
        tmdb_id: "Tmdb",
        origin_country: "Origin Country",
        original_language: "Original Language",
        original_name: "Original Name",
        overview: "Overview",
        poster_path: "Poster Path",
        first_air_date: "First Air Date",
        name: "Name"
      )
    ])
  end

  it "renders a list of shows" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Tmdb".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Origin Country".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Original Language".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Original Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Overview".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Poster Path".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Air Date".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
