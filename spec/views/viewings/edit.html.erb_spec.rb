require 'rails_helper'

RSpec.describe "viewings/edit", type: :view do
  let(:viewing) {
    Viewing.create!(
      status: 1,
      note: "MyText",
      movie_id: "MyString",
      tv_id: "MyString",
      name: "MyString",
      progress: 1,
      user: nil
    )
  }

  before(:each) do
    assign(:viewing, viewing)
  end

  it "renders the edit viewing form" do
    render

    assert_select "form[action=?][method=?]", viewing_path(viewing), "post" do

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
