class Api::V1::Invoices::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find_by(id: params[:id]).merchant
  end
end
