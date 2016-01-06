class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  default_scope -> { order('id DESC') }

  def revenue
    {"revenue"=> self.invoices.successful.joins(:invoice_items).sum("quantity * unit_price")}
  end

  def revenue_with_date(date)
    {"revenue"=> self.invoices.successful.joins(:invoice_items).where(created_at: date).sum("quantity * unit_price")}
  end

  def self.total_revenue(date)
    {"total_revenue" => Invoice.successful.joins(:invoice_items).where(created_at: date).sum("quantity * unit_price")}
  end

  # def favorite_customer
  #   self.invoices.successful.joins(:customers).group()
  #
  # end

  def pending_customers
    need_to_pay = []
    self.invoices.pending.map do |invoice|
      need_to_pay << invoice.customer
    end
    need_to_pay.uniq
  end

end
