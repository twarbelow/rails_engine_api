# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
CSV.foreach(Rails.root.join('/data/customers.csv'), headers: true) do |row|
  Customer.create({
    id: row["id"],
    first_name: row["first_name"],
    last_name: row["last_name"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]
  })
end

CSV.foreach(Rails.root.join('/data/invoice_items.csv'), headers: true) do |row|
  Customer.create({
    id: row["id"],
    item_id: row["item_id"],
    invoice_id: row["invoice_id"],
    quantity: row["quantity"],
    unit_price: row["unit_price"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]
  })
end

CSV.foreach(Rails.root.join('/data/invoices.csv'), headers: true) do |row|
  Customer.create({
    id: row["id"],
    customer_id: row["customer_id"],
    merchant_id: row["merchant_id"],
    status: row["status"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]
  })
end

CSV.foreach(Rails.root.join('/data/items.csv'), headers: true) do |row|
  Customer.create({
    id: row["id"],
    name: row["name"],
    description: row["description"],
    unit_price: row["unit_price"],
    mechant_id: row["merchant_id"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]
  })
end

CSV.foreach(Rails.root.join('/data/merchants.csv'), headers: true) do |row|
  Customer.create({
    id: row["id"],
    name: row["name"],
    created_at: row["created_at"],
    updated_at: row["updated_at"]
  })
end
