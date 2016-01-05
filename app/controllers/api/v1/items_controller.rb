class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(items_params)
  end

  def find_all
    respond_with Item.where(items_params)
  end

  def random
    Item.limit(1).order("RANDOM()")
  end

  private

    def items_params
      params.permit(:id, :name, :description, :merchant_id, :unit_price, :created_at, :updated_at)
    end
end
