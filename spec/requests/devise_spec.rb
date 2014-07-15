require 'rails_helper'

RSpec.describe "Devise", :type => :request do

  describe "User Registration" do
  	before :each do
	    visit root_path
		  expect(page).to have_content "Sign In"

		  click_on "Sign In"
		  expect(current_path).to eq(new_user_session_path)

		  @user = build(:user_with_profile)
		  click_on "Sign Up"
  	end

	  it "must be able to Sign Up with profile photo" do
		  fill_in "Email", with: @user.email
		  fill_in "Password", with: @user.password
		  fill_in "user_password_confirmation", with: @user.password
		  click_on "Sign Up"
		  expect(current_path).to eq(new_profile_path)
		  expect(page).to have_content "New Profile"

			profile = @user.profile
			attach_file "profile_photo", FilePathHelper.male_profile_pic
		  fill_in "First name", with: profile.first_name
		  fill_in "Middle name", with: profile.middle_name
		  fill_in "Last name", with: profile.last_name
		  fill_in "Nickname", with: profile.nickname
		  fill_in "Gender", with: "Male"
		  fill_in "Date of birth", with: profile.date_of_birth
		  click_on "Create Profile"
		  expect(current_path).to eq(root_path)
	  end


	  it "must be able to Sign Up without profile photo" do
		  fill_in "Email", with: @user.email
		  fill_in "Password", with: @user.password
		  fill_in "user_password_confirmation", with: @user.password
		  click_on "Sign Up"
		  expect(current_path).to eq(new_profile_path)
		  expect(page).to have_content "New Profile"

			profile = @user.profile
		  fill_in "First name", with: profile.first_name
		  fill_in "Middle name", with: profile.middle_name
		  fill_in "Last name", with: profile.last_name
		  fill_in "Nickname", with: profile.nickname
		  fill_in "Gender", with: "Male"
		  fill_in "Date of birth", with: profile.date_of_birth
		  click_on "Create Profile"
		  expect(current_path).to eq(root_path)
	  end

	  it "cannot Sign Up empty email" do
	  	fill_in "Email", with: ""
		  fill_in "Password", with: @user.password
		  fill_in "user_password_confirmation", with: @user.password
		  click_on "Sign Up"
		  expect(current_path).to eq(users_path)
		  expect(page).to have_content("can't be blank")
	  end

	  it "cannot Sign Up empty password" do
	  	fill_in "Email", with: @user.email
		  fill_in "Password", with: ""
		  fill_in "user_password_confirmation", with: ""
		  click_on "Sign Up"
		  expect(current_path).to eq(users_path)
		  expect(page).to have_content("can't be blank")
	  end

	  it "cannot Sign Up mismatching password" do
	  	fill_in "Email", with: @user.email
		  fill_in "Password", with: @user.password
		  fill_in "user_password_confirmation", with: @user.email
		  click_on "Sign Up"
		  expect(current_path).to eq(users_path)
		  expect(page).to have_content("doesn't match confirmation")
	  end
  end

  describe "User Login" do
  	before :each do
	    visit root_path
		  expect(page).to have_content "Sign In"

		  click_on "Sign In"
		  expect(current_path).to eq(new_user_session_path)

		  @user = create(:user_with_profile)
  	end

		it "must login with valid credentials" do
			fill_in "Email", with: @user.email
			fill_in "Password", with: @user.password
			click_button "Sign In"
			expect(current_path).to eq(root_path)
			expect(page).to have_content(@user.profile.nickname)
		end

		it "requires email to login" do
			fill_in "Password", with: @user.password
			click_button "Sign In"
			expect(current_path).to eq(new_user_session_path)
		end
	end
end
