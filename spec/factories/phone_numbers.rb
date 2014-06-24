# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone_number do
    country_code "MyString"
    area_code "MyString"
    number "MyString"
    type ""
  end
end
