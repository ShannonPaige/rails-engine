require 'test_helper'

class Api::V1::Transactions::InvoicesControllerTest < ActionController::TestCase

  test "#show returns to json" do
    transaction = create(:transaction)
    get :show, id: transaction.id, format: :json
    assert_response :success
  end
end
