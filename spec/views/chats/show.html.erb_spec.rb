require 'rails_helper'

RSpec.describe "chats/show", type: :view do
  before(:each) do
    assign(:chat, Chat.create!(
      recommend: nil,
      user: nil,
      friend_id: 2,
      message: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
