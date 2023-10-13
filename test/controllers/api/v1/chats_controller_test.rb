require "test_helper"

class Api::V1::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_chats_index_url
    assert_response :success
  end
end
