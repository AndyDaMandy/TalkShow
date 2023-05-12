require 'rails_helper'

RSpec.describe "chats/edit", type: :view do
  let(:chat) {
    Chat.create!(
      recommend: nil,
      user: nil,
      body: "MyText"
    )
  }

  before(:each) do
    assign(:chat, chat)
  end

  it "renders the edit chat form" do
    render

    assert_select "form[action=?][method=?]", chat_path(chat), "post" do

      assert_select "input[name=?]", "chat[recommend_id]"

      assert_select "input[name=?]", "chat[user_id]"

      assert_select "textarea[name=?]", "chat[body]"
    end
  end
end
