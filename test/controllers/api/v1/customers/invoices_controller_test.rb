require "./test/test_helper"

class Api::V1::Customers::InvoicesControllerTest < ActionController::TestCase

  test "index responds to json" do
    customer = create(:customer)
    customer2 = create(:customer)
    get :index, id: Customer.first.id, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    customer = create(:customer)
    customer2 = create(:customer)
    get :index, id: Customer.first.id, format: :json
    assert_kind_of Array, json_response
  end
end
