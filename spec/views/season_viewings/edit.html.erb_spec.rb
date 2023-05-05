require 'rails_helper'

RSpec.describe "season_viewings/edit", type: :view do
  let(:season_viewing) {
    SeasonViewing.create!(
      tmdb_id: 1,
      content_id: 1,
      show: nil,
      user: nil,
      viewing: nil,
      status: 1,
      note: "MyText",
      progress: 1
    )
  }

  before(:each) do
    assign(:season_viewing, season_viewing)
  end

  it "renders the edit season_viewing form" do
    render

    assert_select "form[action=?][method=?]", season_viewing_path(season_viewing), "post" do

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
