# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'viewings/show', type: :view do
  before(:each) do
    assign(:viewing, Viewing.create!(
      status: 2,
      note: 'MyText',
      tmdb_id: 12323,
      name: 'Name',
      progress: 3,
      user: nil
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
