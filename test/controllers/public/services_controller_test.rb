require "test_helper"

class Public::ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_services_index_url
    assert_response :success
  end
end
