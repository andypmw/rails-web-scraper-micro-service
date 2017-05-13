require 'test_helper'

class IndexJobControllerTest < ActionDispatch::IntegrationTest
  def setup
    Customer.new(
      id: 'b617e146-674a-4e6f-a5ef-22d2d2c5412b',
      name: 'Andy'
    ).save!

    Customer.new(
      id: 'a6a862d6-8d3c-4bb7-8921-abf52793f474',
      name: 'Primawan'
    ).save!

    IndexJob.new(
      customer_id: 'b617e146-674a-4e6f-a5ef-22d2d2c5412b',
      id: 'efd00223-3a2f-4bb0-a0b8-e539c0fdd24f',
      status: :success
    ).save!
  end

  def teardown
    Customer.connection.schema.truncate_table(Customer.table_name)
  end


  test "should get customer's index_jobs" do
    get show_customers_jobs_path('b617e146-674a-4e6f-a5ef-22d2d2c5412b')
    assert_response 200
  end

  test "should get index_job's contents" do
    get show_an_index_job_path('b617e146-674a-4e6f-a5ef-22d2d2c5412b', 'efd00223-3a2f-4bb0-a0b8-e539c0fdd24f')
    assert_response 200
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

end
