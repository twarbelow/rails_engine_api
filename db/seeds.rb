# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
CSV.foreach(Rails.root.join('db/data/customers.csv'), headers: true) do |row|
  Customer.create({
    first_name: row["first_name"],
    last_name: row["last_name"],
  })
end

CSV.foreach(Rails.root.join('db/data/merchants.csv'), headers: true) do |row|
  Customer.create({
    name: row["name"],
    })
end

CSV.foreach(Rails.root.join('db/data/invoices.csv'), headers: true) do |row|
  Customer.create({
    customer_id: row["customer_id"],
    merchant_id: row["merchant_id"],
    status: row["status"],
    })
end

CSV.foreach(Rails.root.join('db/data/items.csv'), headers: true) do |row|
  Customer.create({
    name: row["name"],
    description: row["description"],
    unit_price: row["unit_price"].to_f/100.0,
    mechant_id: row["merchant_id"],
    })
end

CSV.foreach(Rails.root.join('db/data/invoice_items.csv'), headers: true) do |row|
  Customer.create({
    item_id: row["item_id"],
    invoice_id: row["invoice_id"],
    quantity: row["quantity"],
    unit_price: row["unit_price"].to_f/100.0,
  })
end
