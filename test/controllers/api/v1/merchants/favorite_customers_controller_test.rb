require 'test_helper'

class Api::V1::Merchants::FavoriteCustomersControllerTest < ActionController::TestCase
  test "#show returns to json" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    transaction = create(:transaction, invoice: invoice)
    get :show, id: merchant.id, format: :json
    assert_response :success
  end

  test "#show returns the correct customer" do
    customer = create(:customer)
    merchant = create(:merchant)
    merchant2 = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    transaction = create(:transaction, invoice: invoice)
    get :show, id: merchant.id, format: :json
    assert_equal customer.id, json_response["id"]
  end
end
