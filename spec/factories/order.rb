FactoryBot.define do
  factory :order do
    address { "Example address" }
    status { "Any status" }
    total_bill { 100.0 }
    association :cart
    association :user
  end
end