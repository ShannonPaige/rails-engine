class Api::V1::Merchants::FavoriteCustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.find_by(id: params[:id]).favorite_customer
  end
end
