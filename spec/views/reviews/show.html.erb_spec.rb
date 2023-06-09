require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  before(:each) do
    assign(:review, Review.create!(
      rating: 2,
      recommend: 3,
      content: "MyText",
      viewing: nil,
      show_id: 4,
      movie_id: 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
