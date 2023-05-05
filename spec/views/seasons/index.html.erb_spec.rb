require 'rails_helper'

RSpec.describe "seasons/index", type: :view do
  before(:each) do
    assign(:seasons, [
      Season.create!(
        name: "Name",
        content_id: 2,
        season_number: 3,
        episode_count: 4,
        air_date: "Air Date",
        overview: "Overview",
        poster_path: "Poster Path"
      ),
      Season.create!(
        name: "Name",
        content_id: 2,
        season_number: 3,
        episode_count: 4,
        air_date: "Air Date",
        overview: "Overview",
        poster_path: "Poster Path"
      )
    ])
  end

  it "renders a list of seasons" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Air Date".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Overview".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Poster Path".to_s), count: 2
  end
end
