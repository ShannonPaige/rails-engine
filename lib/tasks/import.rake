require 'csv'

namespace :db do

  desc "Import Customers from CSV"
  task import: :environment do
    customers
    invoice_items
    invoices
    items
    merchants
    transactions
  end

  private

    def customers
      filename = File.join Rails.root, "/lib/assets/customers.csv"
      counter = 0

      CSV.foreach(filename, headers: true) do |row|
        customer = Customer.create( first_name: row["first_name"],
                                    last_name:  row["last_name"],
                                    created_at: row["created_at"],
                                    updated_at: row["updated_at"])
        puts "#{first_name last_name} - #{customer.errors.full_messages.join(', ')}" if customer.errors.any?
        counter += 1 if customer.persisted?
      end

      puts "Imported #{counter} customers"
    end

    def invoice_items
      filename = File.join Rails.root, "/lib/assets/invoice_items.csv"
      counter = 0

      CSV.foreach(filename, headers: true) do |row|
        invoice_item = InvoiceItem.create(item_id: row["item_id"],
                                          invoice_id:  row["invoice_id"],
                                          quantity: row["quantity"],
                                          unit_price: row["unit_price"],
                                          created_at: row["created_at"],
                                          updated_at: row["updated_at"])
        puts "#{item_id invoice_id} - #{invoice_item.errors.full_messages.join(', ')}" if invoice_item.errors.any?
        counter += 1 if invoice_item.persisted?
      end

      puts "Imported #{counter} invoice_items"
    end

    def invoices
      filename = File.join Rails.root, "/lib/assets/invoices.csv"
      counter = 0

      CSV.foreach(filename, headers: true) do |row|
        invoice = Invoice.create( customer_id: row["customer_id"],
                                  merchant_id:  row["merchant_id"],
                                  status: row["status"],
                                  created_at: row["created_at"],
                                  updated_at: row["updated_at"])
        puts "#{customer_id merchant_id} - #{invoice.errors.full_messages.join(', ')}" if invoice.errors.any?
        counter += 1 if invoice.persisted?
      end

      puts "Imported #{counter} invoices"
    end

    def items
      filename = File.join Rails.root, "/lib/assets/items.csv"
      counter = 0

      CSV.foreach(filename, headers: true) do |row|
        item = Item.create( name: row["name"],
                            description:  row["description"],
                            unit_price:  row["unit_price"],
                            merchant_id:  row["merchant_id"],
                            created_at: row["created_at"],
                            updated_at: row["updated_at"])
        puts "#{name} - #{item.errors.full_messages.join(', ')}" if item.errors.any?
        counter += 1 if item.persisted?
      end

      puts "Imported #{counter} items"
    end

    def merchants
      filename = File.join Rails.root, "/lib/assets/merchants.csv"
      counter = 0

      CSV.foreach(filename, headers: true) do |row|
        merchant = Merchant.create( name: row["first_name"],
                                    created_at: row["created_at"],
                                    updated_at: row["updated_at"])
        puts "#{name} - #{merchant.errors.full_messages.join(', ')}" if merchant.errors.any?
        counter += 1 if merchant.persisted?
      end

      puts "Imported #{counter} merchants"
    end

    def transactions
      filename = File.join Rails.root, "/lib/assets/transactions.csv"
      counter = 0

      CSV.foreach(filename, headers: true) do |row|
        transaction = Transaction.create( invoice_id: row["invoice_id"],
                                          credit_card_number:  row["credit_card_number"],
                                          credit_card_expiration_date:  row["credit_card_expiration_date"],
                                          result:  row["result"],
                                          created_at: row["created_at"],
                                          updated_at: row["updated_at"])
        puts "#{invoice_id} - #{transaction.errors.full_messages.join(', ')}" if transaction.errors.any?
        counter += 1 if transaction.persisted?
      end

      puts "Imported #{counter} transactions"
    end

end
