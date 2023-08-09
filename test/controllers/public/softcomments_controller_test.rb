require "test_helper"

class Public::SoftcommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_softcomments_show_url
    assert_response :success
  end

  test "should get index" do
    get public_softcomments_index_url
    assert_response :success
  end
end
