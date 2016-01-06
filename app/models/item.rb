class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  #has_many :items, through: :invoice_items

  default_scope -> { order('id DESC') }
end
