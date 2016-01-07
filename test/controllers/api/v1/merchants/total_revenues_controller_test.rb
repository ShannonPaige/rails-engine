require 'test_helper'

class Api::V1::Merchants::TotalRevenueControllerTest < ActionController::TestCase

  test "#show returns to json" do
    merchant = create(:merchant)
    get :show, id: merchant.id, format: :json
    assert_response :success
  end
  #
  # test "#show returns the correct amount" do
  #   customer = create(:customer)
  #   merchant = create(:merchant)
  #   merchant2 = create(:merchant)
  #   invoice = create(:invoice, customer: customer, merchant: merchant)
  #   transaction = create(:transaction, invoice: invoice)
  #   invoice_item = create(:invoice_item, item: item, invoice: invoice)
  #   get :show, id: merchant.id, format: :json
  #   assert_equal 20, json_response["total_revenue"]
  # end
end
