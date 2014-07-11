require 'rails_helper'

RSpec.describe "Devise", :type => :request do

  describe "User Registration" do
	  it "must be able to Sign Up" do
	    visit root_path
		  expect(page).to have_content "Sign In"

		  click_on "Sign In"
		  expect(current_path).to eq(new_user_session_path)

		  user = build(:user_with_profile)
		  click_on "Sign Up"
		  fill_in "Email", with: user.email
		  fill_in "Password", with: user.password
		  fill_in "user_password_confirmation", with: user.password
		  click_on "Sign Up"
		  expect(current_path).to eq(new_profile_path)
		  expect(page).to have_content "New Profile"

			profile = user.profile
		  fill_in "First name", with: profile.first_name
		  fill_in "Middle name", with: profile.middle_name
		  fill_in "Last name", with: profile.last_name
		  fill_in "Nickname", with: profile.nickname
		  fill_in "Gender", with: "Male"
		  fill_in "Date of birth", with: profile.date_of_birth
		  click_on "Create Profile"
		  expect(current_path).to eq(root_path)


	  end
  end

end
