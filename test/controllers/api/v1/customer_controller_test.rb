require "./test/test_helper"

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test "index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of items" do
    customer = create(:customer)
    customer2 = create(:customer)
    get :index, format: :json
    assert_equal Customer.count, json_response.count
  end

  test "#index contains items that have the correct properties" do
    customer = create(:customer)
    get :index, format: :json
    json_response.each do |item|
      assert item["first_name"]
      #assert item["last_name"]
    end
  end

  test "#show returns to json" do
    customer = create(:customer)
    get :show, id: Customer.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
        customer = create(:customer)
    get :show, format: :json, id: Customer.first.id
    assert_kind_of Hash, json_response
  end

  test "#show returns the correct item" do
        customer = create(:customer)
        customer2 = create(:customer)
    get :show, format: :json, id: Customer.first.id
    assert_equal Customer.first.id, json_response["id"]
  end


end
