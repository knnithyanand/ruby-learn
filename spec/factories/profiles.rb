# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.last_name }
    nickname { Faker::Internet.user_name(first_name) }
    gender { "Male" }
    date_of_birth { rand(25.years).ago }

    postal_addresses { [attributes_for(:postal_address)] }
    email_addresses { [attributes_for(:email_address)] }
    phone_numbers { [attributes_for(:phone_number)] }
    
    user_roles { [create(:user_role)] }
    
    factory :profile_invalid do
      first_name ""
      last_name ""
      middle_name ""
    end    

    factory :admin_profile do
      user_roles { [create(:admin_role)] }
    end    

    factory :teacher_profile do
      user_roles { [create(:teacher_role)] }
    end    

    factory :student_profile do
      user_roles { [create(:student_role)] }
    end    

    
  end
end
