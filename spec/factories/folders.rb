# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :folder do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    factory :workspace do
      is_workspace true
    end
  end
end
