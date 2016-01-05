class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  default_scope -> { order('id DESC') }
  
end
