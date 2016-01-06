class Api::V1::Items::BestDayController < ApplicationController
  respond_to :json

  def show
    respond_with Item.find_by(id: params[:id]).best_day
  end
end