class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  default_scope -> { order('id DESC') }
  # 
  # def best_day
  #   total_sales_by_day = {}
  #   invoice_quantity = self.invoice_items.pluck(:invoice_id, :quantity)
  #   invoice_quantity.map do |invoice_quantity|
  #     if total_sales_by_day[Invoice.find(invoice_quantity[0]).created_at]
  #       total_sales_by_day[Invoice.find(invoice_quantity[0]).created_at]  += invoice_quantity[1]
  #     else
  #       total_sales_by_day[Invoice.find(invoice_quantity[0]).created_at]  = invoice_quantity[1]
  #     end
  #   end
  #   sorted = total_sales_by_day.to_h.sort_by { |date, quantity| quantity }
  #   max_value = sorted.last.last
  #   {"best_day" => sorted.select { |date, quantity| quantity==max_value }.max_by {|date, quantity| date }.first }
  # end
end
