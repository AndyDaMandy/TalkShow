# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "viewings/new", type: :view do
  before(:each) do
    assign(:viewing, Viewing.new(
      status: 1,
      note: "MyText",
      tmdb_id: 202034,
      name: "MyString",
      progress: 1,
      user: 1
    ))
  end

  it "renders new viewing form" do
    render

    assert_select "form[action=?][method=?]", viewings_path, "post" do

      assert_select "input[name=?]", "viewing[status]"

      assert_select "textarea[name=?]", "viewing[note]"

      assert_select "input[name=?]", "viewing[tmdb_id]"

      assert_select "input[name=?]", "viewing[name]"

      assert_select "input[name=?]", "viewing[progress]"

      # assert_select "input[name=?]", "viewing[user_id]"
    end
  end
end
