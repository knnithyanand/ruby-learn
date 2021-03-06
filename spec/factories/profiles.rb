# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    photo { Rack::Test::UploadedFile.new(FilePathHelper.male_profile_pic) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.last_name }
    nickname { Faker::Internet.user_name(first_name) }
    gender { "Male" }
    date_of_birth { rand(25.years).ago }

    postal_addresses { [attributes_for(:postal_address)] }
    email_addresses { [attributes_for(:email_address)] }
    phone_numbers { [attributes_for(:phone_number)] }

    roles { %i[ guest ] }

    factory :profile_no_photo do
    	photo { nil }
    end

    factory :profile_invalid do
      first_name ""
      last_name ""
      middle_name ""
    end

    factory :admin_profile do
      roles { %i[ administrator ] }
    end

    factory :teacher_profile do
      roles { %i[ teacher ] }
    end

    factory :student_profile do
      roles { %i[ student ] }
    end


  end
end
