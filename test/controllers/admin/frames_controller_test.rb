require "test_helper"

class Admin::FramesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_frames_create_url
    assert_response :success
  end

  test "should get update" do
    get admin_frames_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_frames_destroy_url
    assert_response :success
  end

  test "should get index" do
    get admin_frames_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_frames_show_url
    assert_response :success
  end
end
