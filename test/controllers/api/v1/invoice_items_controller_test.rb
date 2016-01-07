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
    ii = InvoiceItem.create(unit_price: 13.00)
    get :show, id: ii.id, format: :json
    assert_equal "13.00", json_response["unit_price"]
  end




end
