# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    code { Faker::Lorem.word }
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    type "Semister"
  end
end
