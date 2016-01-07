require "./test/test_helper"

class Api::V1::InvoiceItems::ItemsControllerTest < ActionController::TestCase

  test "#show returns to json" do
    invoice_item = create(:invoice_item)
    get :show, id: invoice_item.id, format: :json
    assert_response :success
  end

  test "#show returns the correct item" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    item = create(:item)
    item2 = create(:item)
    invoice_item = create(:invoice_item, item: item, invoice: invoice)
    get :show, id: invoice_item.id, format: :json
    assert_equal item.id, json_response["id"]
    assert_equal "Shoes", json_response["name"]
    assert_equal "Comfy", json_response["description"]
  end
end
