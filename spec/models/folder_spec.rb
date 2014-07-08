require 'rails_helper'

RSpec.describe Folder, :type => :model do
  describe "has valid factory" do
    it "for Folder" do
      expect(create(:folder)).to be_valid
    end
    
    it "for Workspace" do
      expect(create(:workspace)).to be_valid
    end
  end

  it "cannot create folder without name" do
    expect { create(:folder, name: "") }.to raise_error
  end

  it "can create folder without description" do
    expect { create(:folder, description: "") }.not_to raise_error    
  end

end
