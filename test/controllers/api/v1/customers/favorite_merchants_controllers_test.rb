require "./test/test_helper"

class Api::V1::Customers::FavoriteMerchantsControllerTest < ActionController::TestCase

  test "#show returns to json" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    transaction = create(:transaction, invoice: invoice)
    get :show, id: customer.id, format: :json
    assert_response :success
  end

  test "#show returns the correct merchant" do
    customer = create(:customer)
    merchant = create(:merchant)
    merchant2 = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    transaction = create(:transaction, invoice: invoice)
    get :show, id: customer.id, format: :json
    assert_equal merchant.id, json_response["id"]
  end
end
