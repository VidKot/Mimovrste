require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carts_show_url
    assert_response :success
  end

  test "should get add_post" do
    get carts_add_post_url
    assert_response :success
  end

  test "should get remove_post" do
    get carts_remove_post_url
    assert_response :success
  end
end
