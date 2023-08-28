require "test_helper"

class Admin::UserservicesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_userservices_show_url
    assert_response :success
  end
end
