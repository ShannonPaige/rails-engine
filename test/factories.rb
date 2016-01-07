FactoryGirl.define do
  factory :customer do
    first_name "John"
    last_name  "Doe"
  end

  factory :item do
    name "Shoes"
    description "Comfy"
    unit_price 23.34
    merchant
  end

  factory :invoice do
    status "shipped"
    merchant
    customer
  end

  factory :invoice_item do
    quantity 3
    unit_price 89.09
    item
    invoice
  end

  factory :merchant do
    name "John's Fish"
  end

  factory :transaction do
    credit_card_number 2334455667
    result "success"
    invoice
  end
end
