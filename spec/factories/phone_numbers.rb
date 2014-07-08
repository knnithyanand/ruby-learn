# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone_number do
    type { "Home" }
    country_code { Faker::PhoneNumber.subscriber_number(2) }
    area_code { Faker::PhoneNumber.area_code }
    number { Faker::PhoneNumber.subscriber_number(7) }
    
    factory :office_phone do
      type { "Work" }
    end
  end
end
