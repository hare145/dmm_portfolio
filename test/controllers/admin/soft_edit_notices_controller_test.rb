require "test_helper"

class Admin::SoftEditNoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_soft_edit_notices_index_url
    assert_response :success
  end
end
