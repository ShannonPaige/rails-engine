require "./test/test_helper"

class Api::V1::Customers::FavoriteMerchantsControllerTest < ActionController::TestCase

  test "#show returns to json" do
    customer = create(:customer)
    get :show, id: customer.id, format: :json
    assert_response :success
  end
end
