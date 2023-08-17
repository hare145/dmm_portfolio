require "test_helper"

class Public::UserservicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_userservices_show_url
    assert_response :success
  end
end
