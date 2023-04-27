require 'rails_helper'

RSpec.describe "shows/new", type: :view do
  before(:each) do
    assign(:show, Show.new(
      tmdb_id: "MyString",
      origin_country: "MyString",
      original_language: "MyString",
      original_name: "MyString",
      overview: "MyString",
      poster_path: "MyString",
      first_air_date: "MyString",
      name: "MyString"
    ))
  end

  it "renders new show form" do
    render

    assert_select "form[action=?][method=?]", shows_path, "post" do

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
