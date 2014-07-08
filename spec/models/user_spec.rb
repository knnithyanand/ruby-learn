require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it "can be assigned a profile" do
    expect(create(:user_with_profile)).to be_valid
  end

  it "can be assigned a role" do
    expect(create(:admin)).to be_valid
  end

  it "must fail to create an empty user" do 
    expect(build(:empty_user)).not_to be_valid
  end

  it "validates presence of email" do 
    expect(build(:user, email: "")).not_to be_valid
  end
  
  it "validates presence of password" do 
    expect(build(:user, password: "")).not_to be_valid
  end
  
  it "cannot have duplicate email" do
    create(:user, email: "bob@example.com")
    expect(build(:user, email: "bob@example.com")).not_to be_valid
  end
  
end
