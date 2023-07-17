require "test_helper"

class Public::SoftsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_softs_index_url
    assert_response :success
  end

  test "should get show" do
    get public_softs_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_softs_edit_url
    assert_response :success
  end

  test "should get notice" do
    get public_softs_notice_url
    assert_response :success
  end
end
