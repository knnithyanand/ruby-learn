require 'rails_helper'

RSpec.describe Profile, :type => :model do
  it "has a valid factory" do
    expect(create(:profile)).to be_valid
  end

  it "embeds postal address" do
    expect(create(:profile).postal_addresses.exists?).to eql(true)
  end

  it "embeds email address" do
    expect(create(:profile).email_addresses.exists?).to eql(true)
  end

  it "embeds phone numbers" do
    expect(create(:profile).phone_numbers.exists?).to eql(true)
  end


  it "has a role defined" do
    expect(create(:profile).user_roles.exists?).to eql(true)
  end
  
  it "show full name" do
    expect(build(:profile).full_name).not_to be_nil
  end
end
