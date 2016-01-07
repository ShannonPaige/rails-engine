require 'test_helper'

class Api::V1::Merchants::InvoicesControllerTest < ActionController::TestCase

  test "index responds to json" do
    merchant = create(:merchant)
    get :index, id: merchant.id, format: :json
    assert_response :success
  end

  test "#index returns correct number of records" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)
    invoice2 = create(:invoice, merchant: merchant)
    invoice3 = create(:invoice, merchant: merchant)
    get :index, id: merchant.id, format: :json
    assert_equal 3, json_response.count
  end

  test "#index returns the correct item" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant)
    get :index, id: merchant.id, format: :json
    assert_equal merchant.id, json_response.first["merchant_id"]
    assert_equal "shipped", json_response.first["status"]
  end
end
