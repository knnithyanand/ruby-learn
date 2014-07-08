# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_address do
    type { "Personal" }
    email { Faker::Internet.free_email }
    
    factory :work_email do
      type { "Work" }
    end
  end
end
