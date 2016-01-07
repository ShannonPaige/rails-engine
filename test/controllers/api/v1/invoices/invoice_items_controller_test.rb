require "./test/test_helper"

class Api::V1::Invoices::InvoiceItemsControllerTest < ActionController::TestCase

  test "index responds to json" do
    invoice = create(:invoice)
    get :index, id: invoice.id, format: :json
    assert_response :success
  end
end
