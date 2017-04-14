FactoryGirl.define do
  factory :product do
    name { Faker::Name.name  }
    price { Faker::Number.number(2) }
  end
end
