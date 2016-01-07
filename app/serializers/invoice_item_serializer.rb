class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :unit_price, :created_at, :updated_at, :item_id, :invoice_id, :quantity

  # def unit_price
  #   object.unit_price
  # end

end
