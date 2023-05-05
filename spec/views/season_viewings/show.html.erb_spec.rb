require 'rails_helper'

RSpec.describe "season_viewings/show", type: :view do
  before(:each) do
    assign(:season_viewing, SeasonViewing.create!(
      tmdb_id: 2,
      content_id: 3,
      show: nil,
      user: nil,
      viewing: nil,
      status: 4,
      note: "MyText",
      progress: 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/5/)
  end
end
