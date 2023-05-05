require 'rails_helper'

RSpec.describe "season_viewings/index", type: :view do
  before(:each) do
    assign(:season_viewings, [
      SeasonViewing.create!(
        tmdb_id: 2,
        content_id: 3,
        show: nil,
        user: nil,
        viewing: nil,
        status: 4,
        note: "MyText",
        progress: 5
      ),
      SeasonViewing.create!(
        tmdb_id: 2,
        content_id: 3,
        show: nil,
        user: nil,
        viewing: nil,
        status: 4,
        note: "MyText",
        progress: 5
      )
    ])
  end

  it "renders a list of season_viewings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(4.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(5.to_s), count: 2
  end
end
