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

  test "index job shouldn't created if customer_id or page_url is empty" do
    post create_path, params: {
      customer_id: '2e9d39ca-b708-4870-bbff-c21f55cadc7f'
    }
    assert_response 400

    post create_path, params: {
      page_url: 'http://andy.primawan.com'
    }
    assert_response 400
  end

  test "index job shouldn't created if page_url is not a valid HTTP or HTTPS URI" do
    post create_path, params: {
      customer_id: '2e9d39ca-b708-4870-bbff-c21f55cadc7f',
      page_url: 'ftp://andy.primawan.com'
    }
    assert_response 400
  end

  test "index job should created if parameters is complete" do
    post create_path, params: {
      customer_id: '2e9d39ca-b708-4870-bbff-c21f55cadc7f',
      page_url: 'http://andy.primawan.com'
    }
    assert_response 201
  end

  test "should get cancel" do
    get cancel_path
    assert_response :success
  end

end
