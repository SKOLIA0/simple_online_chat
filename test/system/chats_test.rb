require "application_system_test_case"

class ChatsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit chats_url
    assert_selector "h1", text: "Chats"
  end

  test "creating a chat" do
    visit chats_url
    click_on "New Chat"

    fill_in "Title", with: "Test Chat"
    click_on "Create Chat"

    assert_text "Chat was successfully created"
    click_on "Back"
  end
end
