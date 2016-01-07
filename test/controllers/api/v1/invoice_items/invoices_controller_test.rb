require "./test/test_helper"

class Api::V1::InvoiceItems::InvoicesControllerTest < ActionController::TestCase

  test "#show returns to json" do
    invoice_item = create(:invoice_item)
    get :show, id: invoice_item.id, format: :json
    assert_response :success
  end

  # test "#show returns one record" do
  #   invoice_item = create(:invoice_item)
  #   get :show, id: invoice_item.id, format: :json, id: invoice_item.id
  #   assert_kind_of Hash, json_response
  # end
end
