require "./test/test_helper"

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase

  def set_up
    json_response = JSON.parse(response.body)
  end

  test "index responds to json" do
    get :index, id: Customer.first.id, format: :json
    assert_response :success
  end
end
