require "./test/test_helper"

class Api::V1::InvoicesControllerTest < ActionController::TestCase

  def set_up
    json_response = JSON.parse(response.body)
  end

  test "index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "#index returns an array of records" do
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of items" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :index, format: :json
    assert_equal Invoice.count, json_response.count
  end

  test "#index contains items that have the correct properties" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :index, format: :json
    json_response.each do |item|
      assert item["status"]
    end
  end

  test "#show returns to json" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :show, id: Invoice.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :show, format: :json, id: Invoice.first.id
    assert_kind_of Hash, json_response
  end

  test "#show returns the correct item" do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    get :show, format: :json, id: Invoice.first.id
    assert_equal Invoice.first.id, json_response["id"]
  end


end
