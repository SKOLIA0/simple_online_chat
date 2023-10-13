require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat = chats(:one) # предполагая, что у вас есть чаты в fixtures
  end

  test "should get index" do
    get chats_url
    assert_response :success
    assert_not_nil assigns(:chats)
  end

  test "should get new" do
    get new_chat_url
    assert_response :success
  end

  test "should create chat" do
    assert_difference('Chat.count') do
      post chats_url, params: { chat: { title: 'New Chat' } }
    end
    assert_redirected_to chat_url(Chat.last)
  end

  test "should show chat" do
    get chat_url(@chat)
    assert_response :success
  end
end

