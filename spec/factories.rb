FactoryBot.define do
  factory :merchant do
    name { Faker::Company.name }
  end

  factory :item do
    name { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
    unit_price { Faker::Commerce.price }
    merchant
  end
end
