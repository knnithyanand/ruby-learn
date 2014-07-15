require 'rails_helper'

RSpec.describe "Profiles", :type => :request do
  describe "Create Profile" do
  	before :each do
		  @user = create(:user)

	    visit root_path
		  expect(page).to have_content "Sign In"

		  click_on "Sign In"
		  expect(current_path).to eq(new_user_session_path)

    	fill_in "Email", with: @user.email
    	fill_in "Password", with: @user.password
    	click_button "Sign In"
  	end

    it "must on first time login" do
    	visit root_path

		  expect(current_path).to eq(new_profile_path)
		  expect(page).to have_content "New Profile"
    end

		it "must create a valid profile" do
			profile = build(:profile)
			visit new_profile_path

		  expect(page).to have_content "New Profile"
		  fill_in "First name", with: profile.first_name
		  fill_in "Middle name", with: profile.middle_name
		  fill_in "Last name", with: profile.last_name
		  fill_in "Nickname", with: profile.last_name
		  fill_in "Gender", with: profile.gender
		  fill_in "Date of birth", with: profile.date_of_birth

		  click_on "Create Profile"
		  expect(current_path).to eq(root_path)



		end
  end
end
