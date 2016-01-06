class Api::V1::Merchants::RevenuesController < ApplicationController
  respond_to :json

  def show
    if params[:date]
      respond_with Merchant.find_by(id: params[:id]).revenue_with_date(params[:date])
    else
      respond_with Merchant.find_by(id: params[:id]).revenue
    end
  end
end
