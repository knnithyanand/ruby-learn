# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postal_address do
    type { "Home" }
    street { Faker::Address.street_address }
    area { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    postcode { Faker::Address.postcode }

    factory :office_address do
      type { "Work" }
    end
  end
end
