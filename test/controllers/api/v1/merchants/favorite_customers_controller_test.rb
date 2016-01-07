require 'test_helper'

class Api::V1::Merchants::FavoriteCustomersControllerTest < ActionController::TestCase

  test "index responds to json" do
    merchant = create(:merchant)
    get :index, id: merchant.id, format: :json
    assert_response :success
  end
end
