require 'rails_helper'

RSpec.describe "shows/edit", type: :view do
  let(:show) {
    Show.create!(
      tmdb_id: "MyString",
      origin_country: "MyString",
      original_language: "MyString",
      original_name: "MyString",
      overview: "MyString",
      poster_path: "MyString",
      first_air_date: "MyString",
      name: "MyString"
    )
  }

  before(:each) do
    assign(:show, show)
  end

  it "renders the edit show form" do
    render

    assert_select "form[action=?][method=?]", show_path(show), "post" do

      assert_select "input[name=?]", "show[tmdb_id]"

      assert_select "input[name=?]", "show[origin_country]"

      assert_select "input[name=?]", "show[original_language]"

      assert_select "input[name=?]", "show[original_name]"

      assert_select "input[name=?]", "show[overview]"

      assert_select "input[name=?]", "show[poster_path]"

      assert_select "input[name=?]", "show[first_air_date]"

      assert_select "input[name=?]", "show[name]"
    end
  end
end
