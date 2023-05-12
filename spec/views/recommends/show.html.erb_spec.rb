require 'rails_helper'

RSpec.describe "recommends/show", type: :view do
  before(:each) do
    assign(:recommend, Recommend.create!(
      user: nil,
      friend: nil,
      show: nil,
      tmdb_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
