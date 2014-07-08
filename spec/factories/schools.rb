# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :school do
    name { Faker::Company.name }
    building { Faker::Address.building_number }
    street { Faker::Address.street_name }
    locality { Faker::Address.street_name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    postcode { Faker::Address.postcode }
    phone { Faker::PhoneNumber.phone_number }
    fax { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    notes { Faker::Lorem.paragraph(5) }

    factory :school_invalid do
      name ""
      email ""
    end
  end
end
