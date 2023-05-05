require 'rails_helper'

RSpec.describe "season_viewings/new", type: :view do
  before(:each) do
    assign(:season_viewing, SeasonViewing.new(
      tmdb_id: 1,
      content_id: 1,
      show: nil,
      user: nil,
      viewing: nil,
      status: 1,
      note: "MyText",
      progress: 1
    ))
  end

  it "renders new season_viewing form" do
    render

    assert_select "form[action=?][method=?]", season_viewings_path, "post" do

      assert_select "input[name=?]", "season_viewing[tmdb_id]"

      assert_select "input[name=?]", "season_viewing[content_id]"

      assert_select "input[name=?]", "season_viewing[show_id]"

      assert_select "input[name=?]", "season_viewing[user_id]"

      assert_select "input[name=?]", "season_viewing[viewing_id]"

      assert_select "input[name=?]", "season_viewing[status]"

      assert_select "textarea[name=?]", "season_viewing[note]"

      assert_select "input[name=?]", "season_viewing[progress]"
    end
  end
end
