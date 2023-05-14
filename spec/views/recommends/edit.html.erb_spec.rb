require 'rails_helper'

RSpec.describe "recommends/edit", type: :view do
  let(:recommend) {
    Recommend.create!(
      user: nil,
      friend_id: 1,
      show: nil,
      tmdb_id: 1
    )
  }

  before(:each) do
    assign(:recommend, recommend)
  end

  it "renders the edit recommend form" do
    render

    assert_select "form[action=?][method=?]", recommend_path(recommend), "post" do

      assert_select "input[name=?]", "recommend[user_id]"

      assert_select "input[name=?]", "recommend[friend_id]"

      assert_select "input[name=?]", "recommend[show_id]"

      assert_select "input[name=?]", "recommend[tmdb_id]"
    end
  end
end
