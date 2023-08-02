require "test_helper"

class Public::UserServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_user_services_show_url
    assert_response :success
  end
end
