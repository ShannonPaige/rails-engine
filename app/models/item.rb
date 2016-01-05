class Item < ActiveRecord::Base
  belongs_to :merchant

  #default_scope -> { order('id DESC') }
end
