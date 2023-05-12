require 'rails_helper'

RSpec.describe "recommends/index", type: :view do
  before(:each) do
    assign(:recommends, [
      Recommend.create!(
        user: nil,
        friend: nil,
        show: nil,
        tmdb_id: 2
      ),
      Recommend.create!(
        user: nil,
        friend: nil,
        show: nil,
        tmdb_id: 2
      )
    ])
  end

  it "renders a list of recommends" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
