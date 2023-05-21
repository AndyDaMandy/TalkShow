require 'rails_helper'

RSpec.describe "chats/new", type: :view do
  before(:each) do
    assign(:chat, Chat.new(
      recommend: nil,
      user: nil,
      friend_id: 1,
      message: "MyText"
    ))
  end

  it "renders new chat form" do
    render

    assert_select "form[action=?][method=?]", chats_path, "post" do

      assert_select "input[name=?]", "chat[recommend_id]"

      assert_select "input[name=?]", "chat[user_id]"

      assert_select "input[name=?]", "chat[friend_id]"

      assert_select "textarea[name=?]", "chat[message]"
    end
  end
end
