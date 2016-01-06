require "./test/test_helper"

class Api::V1::CustomersControllerTest < ActionController::TestCase

  def set_up
    json_response = JSON.parse(response.body)
  end

  test "index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "index returns array of records" do
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test "index returns the correct number of items" do
    get :index, format: :json
    assert_equal Customer.count, json_response.count
  end

  

end
