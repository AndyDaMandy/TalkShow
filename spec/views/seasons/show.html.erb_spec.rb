require 'rails_helper'

RSpec.describe "seasons/show", type: :view do
  before(:each) do
    assign(:season, Season.create!(
      name: "Name",
      content_id: 2,
      season_number: 3,
      episode_count: 4,
      air_date: "Air Date",
      overview: "Overview",
      poster_path: "Poster Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Air Date/)
    expect(rendered).to match(/Overview/)
    expect(rendered).to match(/Poster Path/)
  end
end
