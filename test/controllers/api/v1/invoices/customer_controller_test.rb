require "./test/test_helper"

class Api::V1::Invoices::CustomersControllerTest < ActionController::TestCase

  test "#show returns to json" do
    invoice = create(:invoice)
    get :show, id: invoice.id, format: :json
    assert_response :success
  end
end
