desc 'Drop, create, migrate then seed the development database'
task seed_from_csv: [ 'db:drop', 'db:create', 'db:migrate', 'db:seed' ] do
  puts 'Reseeding completed.'
end

# Clear your Development database to prevent data duplication
# Seed your Development database with the CSV data
# Be invokable through Rake, i.e. you should be able to run bundle exec rake <your_rake_task_name> from the command line
# Convert all prices before storing. Prices are in cents, therefore you will need to transform them to dollars. (12345 becomes 123.45)
# Reset the primary key sequence for each table you import so that new records will receive the next valid primary key.

# Dir.glob("rails_engine_api/app/db/data/*.csv").each { |file| require file }

# CSV.foreach(Rails.root.join('/data/invoice_items.csv'), headers: true) do |row|
#   Customer.create({
#     id: row["id"],
#     item_id: row["item_id"],
#     invoice_id: row["invoice_id"],
#     quantity: row["quantity"],
#     unit_price: row["unit_price"],
#     created_at: row["created_at"],
#     updated_at: row["updated_at"]
#   })
# end
