FactoryBot.define do
  factory :product do
    title { "Example Product" }
    description { "Example Description" }
    price { 10.00 }
    total_quantity { 100 }
    quantity_in_stock { 50 }
  end
end
