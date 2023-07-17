require "test_helper"

class Admin::SoftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_softs_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_softs_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_softs_edit_url
    assert_response :success
  end
end
