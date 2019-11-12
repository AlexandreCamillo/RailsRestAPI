require 'test_helper'

class PlatformsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get platforms_show_url
    assert_response :success
  end

  test "should get list" do
    get platforms_list_url
    assert_response :success
  end

  test "should get create" do
    get platforms_create_url
    assert_response :success
  end

  test "should get update" do
    get platforms_update_url
    assert_response :success
  end

  test "should get delete" do
    get platforms_delete_url
    assert_response :success
  end

end
