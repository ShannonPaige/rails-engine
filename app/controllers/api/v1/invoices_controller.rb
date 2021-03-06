class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.where(invoice_params)
  end

  def show
    respond_with Invoice.find_by(invoice_params)
  end

  def random
    Invoice.limit(1).order("RANDOM()")
  end

  def random
    respond_with Invoice.limit(1).order("RANDOM()")
  end

  private

    def invoice_params
      params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
    end
end
