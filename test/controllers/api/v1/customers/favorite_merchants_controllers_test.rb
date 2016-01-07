require "./test/test_helper"

class Api::V1::Customers::FavoriteMerchantsControllerTest < ActionController::TestCase

  def set_up
    json_response = JSON.parse(response.body)
  end
  # 
  # test "#show returns to json" do
  #   c = Customer.create(first_name: "Bob")
  #   get :show, id: c.id, format: :json
  #   assert_response :success
  # end
end
