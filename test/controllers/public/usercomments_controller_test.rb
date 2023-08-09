require "test_helper"

class Public::UsercommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_usercomments_show_url
    assert_response :success
  end

  test "should get index" do
    get public_usercomments_index_url
    assert_response :success
  end
end
