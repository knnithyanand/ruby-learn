# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_role do
    name { "User" }
    description { Faker::Lorem.paragraph }
    
    factory :user_role_invalid do
      name { "Administrator" }
    end
    
    factory :admin_role do
      name { "Administrator" }
    end
    
    factory :teacher_role do
      name { "Teacher" }
    end
    
    factory :student_role do
      name { "Student" }
    end
  end
end
