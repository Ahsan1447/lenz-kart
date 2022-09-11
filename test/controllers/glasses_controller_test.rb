require "test_helper"

class GlassesControllerTest < ActionDispatch::IntegrationTest
  test "should get add_to_cart" do
    get glasses_add_to_cart_url
    assert_response :success
  end
end
