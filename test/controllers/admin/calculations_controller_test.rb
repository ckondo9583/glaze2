require "test_helper"

class Admin::CalculationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_calculations_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_calculations_show_url
    assert_response :success
  end
end
