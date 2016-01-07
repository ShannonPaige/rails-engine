require "./test/test_helper"

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase

  test "index responds to json" do
    item = create(:item)
    get :index, id: item.id, format: :json
    assert_response :success
  end
end
