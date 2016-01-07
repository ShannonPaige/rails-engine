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

  test "#index returns correct number of records" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    invoice2 = create(:invoice, customer: customer)
    invoice3 = create(:invoice, customer: customer)
    get :index, id: Customer.first.id, format: :json
    assert_equal 3, json_response.count
  end

  test "#index returns the correct item" do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    get :index, id: Customer.first.id, format: :json
    assert_equal Customer.first.id, json_response.first["customer_id"]
    assert_equal "shipped", json_response.first["status"]
  end
end
