require 'rails_helper'

RSpec.describe "seasons/edit", type: :view do
  let(:season) {
    Season.create!(
      name: "MyString",
      content_id: 1,
      season_number: 1,
      episode_count: 1,
      air_date: "MyString",
      overview: "MyString",
      poster_path: "MyString"
    )
  }

  before(:each) do
    assign(:season, season)
  end

  it "renders the edit season form" do
    render

    assert_select "form[action=?][method=?]", season_path(season), "post" do

      assert_select "input[name=?]", "season[name]"

      assert_select "input[name=?]", "season[content_id]"

      assert_select "input[name=?]", "season[season_number]"

      assert_select "input[name=?]", "season[episode_count]"

      assert_select "input[name=?]", "season[air_date]"

      assert_select "input[name=?]", "season[overview]"

      assert_select "input[name=?]", "season[poster_path]"
    end
  end
end
