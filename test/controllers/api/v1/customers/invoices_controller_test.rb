require "./test/test_helper"

class Api::V1::Customers::InvoicesControllerTest < ActionController::TestCase

  def set_up
    json_response = JSON.parse(response.body)
  end

  test "index responds to json" do
    get :index, id: Customer.first.id, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, id: Customer.first.id, format: :json
    assert_kind_of Array, json_response
  end

  test "#index contains items that have the correct properties" do
    get :index, id: Customer.first.id, format: :json
    json_response.each do |item|
      assert item["first_name"]
      assert item["last_name"]
    end
  end
end
