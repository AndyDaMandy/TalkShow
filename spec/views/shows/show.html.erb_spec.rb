require 'rails_helper'

RSpec.describe "shows/show", type: :view do
  before(:each) do
    assign(:show, Show.create!(
      tmdb_id: "Tmdb",
      origin_country: "Origin Country",
      original_language: "Original Language",
      original_name: "Original Name",
      overview: "Overview",
      poster_path: "Poster Path",
      first_air_date: "First Air Date",
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tmdb/)
    expect(rendered).to match(/Origin Country/)
    expect(rendered).to match(/Original Language/)
    expect(rendered).to match(/Original Name/)
    expect(rendered).to match(/Overview/)
    expect(rendered).to match(/Poster Path/)
    expect(rendered).to match(/First Air Date/)
    expect(rendered).to match(/Name/)
  end
end
