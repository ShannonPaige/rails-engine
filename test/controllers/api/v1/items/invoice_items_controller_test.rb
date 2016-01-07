require "./test/test_helper"

class Api::V1::Items::InvoiceItemsControllerTest < ActionController::TestCase

  def set_up
    json_response = JSON.parse(response.body)
  end

  test "index responds to json" do
    get :index, id: Item.first.id, format: :json
    assert_response :success
  end
end
