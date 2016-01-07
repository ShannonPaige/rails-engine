require 'test_helper'

class Api::V1::Merchants::TotalRevenueControllerTest < ActionController::TestCase

  test "#show returns to json" do
    merchant = create(:merchant)
    get :show, id: merchant.id, format: :json
    assert_response :success
  end
end
