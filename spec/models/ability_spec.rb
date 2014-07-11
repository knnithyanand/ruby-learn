require "cancan/matchers"

RSpec.describe Ability, :type => :model do
  describe "abilities" do
		before :each do
		  @ablity = Ability.new(create(:teacher))
		end

    it"must be able to manage Folder" do
    	expect(@ablity).to be_able_to(:create, Folder)
    end
  end

end
