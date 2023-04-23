require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  let(:review) {
    Review.create!(
      rating: 1,
      recommend: 1,
      content: "MyText",
      viewing: nil,
      show_id: 1,
      movie_id: 1
    )
  }

  before(:each) do
    assign(:review, review)
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(review), "post" do

      assert_select "input[name=?]", "review[rating]"

      assert_select "input[name=?]", "review[recommend]"

      assert_select "textarea[name=?]", "review[content]"

      assert_select "input[name=?]", "review[viewing_id]"

      assert_select "input[name=?]", "review[show_id]"

      assert_select "input[name=?]", "review[movie_id]"
    end
  end
end
