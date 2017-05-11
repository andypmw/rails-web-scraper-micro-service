require 'test_helper'

class IndexJobControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_path
    assert_response :success
  end

  test "should get show" do
    get show_path(123)
    assert_response :success
  end

  test "should get create" do
    get create_path
    assert_response :success
  end

  test "should get cancel" do
    get cancel_path
    assert_response :success
  end

end
