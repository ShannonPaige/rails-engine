require 'csv'

namespace :import do

  desc "Import Customers from CSV"
  task customers: :environment do
    filename = File.join Rails.root, "customers.csv"
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

  desc "Import Customers from CSV"
  task customers: :environment do
    filename = File.join Rails.root, "customers.csv"
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
end
