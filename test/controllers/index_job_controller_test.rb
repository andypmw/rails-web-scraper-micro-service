require 'test_helper'

class IndexJobControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_job_index_url
    assert_response :success
  end

  test "should get show" do
    get index_job_show_url
    assert_response :success
  end

  test "should get create" do
    get index_job_create_url
    assert_response :success
  end

  test "should get cancel" do
    get index_job_cancel_url
    assert_response :success
  end

end
