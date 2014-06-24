# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postal_address do
    Street "MyText"
    Area "MyString"
    State "MyString"
    City "MyString"
    Country "MyString"
    Postcode "MyString"
    Type "MyString"
  end
end
