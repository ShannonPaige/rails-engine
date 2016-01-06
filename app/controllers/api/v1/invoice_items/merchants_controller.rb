class Api::V1::InvoiceItems::MerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItems.find_by(id: params[:id]).merchant
  end
end
