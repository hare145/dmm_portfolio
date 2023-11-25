require "test_helper"

class DammeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get damme_index_url
    assert_response :success
  end
end
