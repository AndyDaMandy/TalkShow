require 'rails_helper'

RSpec.describe "recommends/new", type: :view do
  before(:each) do
    assign(:recommend, Recommend.new(
      user: nil,
      friend: nil,
      show: nil,
      tmdb_id: 1
    ))
  end

  it "renders new recommend form" do
    render

    assert_select "form[action=?][method=?]", recommends_path, "post" do

      assert_select "input[name=?]", "recommend[user_id]"

      assert_select "input[name=?]", "recommend[friend_id]"

      assert_select "input[name=?]", "recommend[show_id]"

      assert_select "input[name=?]", "recommend[tmdb_id]"
    end
  end
end
