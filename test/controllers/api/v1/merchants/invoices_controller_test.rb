require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase
  def set_up
    json_response = JSON.parse(response.body)
  end

  test "index responds to json" do
    get :index, id: Merchant.first.id, format: :json
    assert_response :success
  end
end
