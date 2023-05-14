require 'rails_helper'

RSpec.describe "viewings/index", type: :view do
  before(:each) do
    assign(:viewings, [
      Viewing.create!(
        status: 2,
        note: "MyText",
        tmdb_id: 202034,
        name: "Name",
        progress: 3,
        user: nil
      ),
      Viewing.create!(
        status: 2,
        note: "MyText",
        tmdb_id: 12034,
        name: "Name",
        progress: 3,
        user: nil
      )
    ])
  end

  it "renders a list of viewings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    # assert_select cell_selector, text: Regexp.new("Movie".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
