class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  default_scope -> { order('id DESC') }

  def favorite_merchant
    merchant_purchases = {}
    self.invoices do |invoice|

    end

  end

end
