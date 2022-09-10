require "test_helper"

class LensesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lenses_index_url
    assert_response :success
  end
end
