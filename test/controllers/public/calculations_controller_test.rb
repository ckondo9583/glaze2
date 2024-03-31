require "test_helper"

class Public::CalculationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_calculations_index_url
    assert_response :success
  end

  test "should get show" do
    get public_calculations_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_calculations_edit_url
    assert_response :success
  end
end
