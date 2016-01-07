require "./test/test_helper"

class Api::V1::InvoiceItems::InvoicesControllerTest < ActionController::TestCase

  test "#show returns to json" do
    invoice_item = create(:invoice_item)
    get :show, id: invoice_item.id, format: :json
    assert_response :success
  end

  test "#show returns the correct invoice" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    invoice2 = create(:invoice, customer: customer, merchant: merchant)
    item = create(:item)
    invoice_item = create(:invoice_item, item: item, invoice: invoice)
    get :show, id: invoice_item.id, format: :json
    assert_equal invoice.id, json_response["id"]
    assert_equal "shipped", json_response["status"]
  end
end
