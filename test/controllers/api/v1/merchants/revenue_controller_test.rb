require 'test_helper'

class Api::V1::Merchants::RevenueControllerTest < ActionController::TestCase

  test "show responds to json" do
    merchant = create(:merchant)
    get :show, id: merchant.id, format: :json
    assert_response :success
  end
end
