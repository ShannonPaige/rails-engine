require "./test/test_helper"

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase

  def set_up
    json_response = JSON.parse(response.body)
  end

  test "index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "index returns price with 2 decimals" do
    invoice_item = create(:invoice_item, unit_price: 13.00)
    get :show, id: invoice_item.id, format: :json
    assert_equal "13.00", json_response["unit_price"]
  end

  test "#index returns an array of records" do
    get :index, format: :json
    assert_kind_of Array, json_response
  end

  test "#index returns the correct number of items" do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    get :index, format: :json
    assert_equal InvoiceItem.count, json_response.count
  end

  test "#index contains items that have the correct properties" do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    get :index, format: :json
    json_response.each do |item|
      assert item["quantity"]
      assert item["unit_price"]
    end
  end

  test "#show returns to json" do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    get :show, id: InvoiceItem.first.id, format: :json
    assert_response :success
  end

  test "#show returns one record" do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    get :show, format: :json, id: InvoiceItem.first.id
    assert_kind_of Hash, json_response
  end

  test "#show returns the correct item" do
    invoice_item = create(:invoice_item)
    invoice_item2 = create(:invoice_item)
    get :show, format: :json, id: InvoiceItem.first.id
    assert_equal InvoiceItem.first.id, json_response["id"]
  end
end
