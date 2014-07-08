# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "p@ssw0rd"
    
    factory :empty_user do
      email ""
      password ""
    end

    factory :user_with_profile do
      profile { create(:profile) }
    end    

    factory :admin do
      profile { create(:admin_profile) }
    end    

    factory :teacher do
      profile { create(:teacher_profile) }
    end    

    factory :student do
      profile { create(:student_profile) }
    end    

    after(:create) do |user, evaluator|
      profile = user.profile
      profile.save! if profile
    end
  end

end
