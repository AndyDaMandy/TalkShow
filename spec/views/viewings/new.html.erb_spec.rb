require 'rails_helper'

RSpec.describe "viewings/new", type: :view do
  before(:each) do
    assign(:viewing, Viewing.new(
      status: 1,
      note: "MyText",
      movie_id: "MyString",
      tv_id: "MyString",
      name: "MyString",
      progress: 1,
      user: nil
    ))
  end

  it "renders new viewing form" do
    render

    assert_select "form[action=?][method=?]", viewings_path, "post" do

      assert_select "input[name=?]", "viewing[status]"

      assert_select "textarea[name=?]", "viewing[note]"

      assert_select "input[name=?]", "viewing[movie_id]"

      assert_select "input[name=?]", "viewing[tv_id]"

      assert_select "input[name=?]", "viewing[name]"

      assert_select "input[name=?]", "viewing[progress]"

      assert_select "input[name=?]", "viewing[user_id]"
    end
  end
end
