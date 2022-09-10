require "test_helper"

class Admin::LensesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_lenses_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_lenses_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_lenses_destroy_url
    assert_response :success
  end

  test "should get index" do
    get admin_lenses_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_lenses_show_url
    assert_response :success
  end
end
