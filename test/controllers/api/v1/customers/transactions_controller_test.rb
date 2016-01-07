require "./test/test_helper"

class Api::V1::Customers::TransactionsControllerTest < ActionController::TestCase

  test "index responds to json" do
    customer = create(:customer)
    customer2 = create(:customer)
    get :index, id: Customer.first.id, format: :json
    assert_response :success
  end

  test "#index returns the correct number of records" do
    customer = create(:customer)
    merchant = create(:merchant)
    merchant2 = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    transaction = create(:transaction, invoice: invoice)
    transaction2 = create(:transaction, invoice: invoice)
    get :index, id: customer.id, format: :json
    assert_equal 2, json_response.count
  end

  test "#index returns the correct records" do
    customer = create(:customer)
    merchant = create(:merchant)
    merchant2 = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant)
    transaction = create(:transaction, invoice: invoice)
    transaction2 = create(:transaction, invoice: invoice)
    transaction3 = create(:transaction, invoice: invoice)
    get :index, id: customer.id, format: :json
    assert_equal transaction.id, json_response.last["id"]
    assert_equal "2334455667", json_response.last["credit_card_number"]
  end
end
