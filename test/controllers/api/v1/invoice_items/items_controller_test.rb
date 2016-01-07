require "./test/test_helper"

class Api::V1::InvoiceItems::ItemsControllerTest < ActionController::TestCase

  test "#show returns to json" do
    invoice_item = create(:invoice_item)
    get :show, id: invoice_item.id, format: :json
    assert_response :success
  end
end
