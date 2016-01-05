require "./test/test_helper"

class Api::V1::CustomerControllerTest < ActionController::TestCase
  test "index responds to json" do
    get :index, format: :json
    assert_response :success
  end

  test "index returns array of records" do
    skip
    get :index, format: :json
  end

end
