require "rails_helper"

RSpec.describe FileItemsController, :type => :routing do
  describe "routing" do

    before :each do
      @file_item = create(:file_item_with_folder)
      @folder = @file_item.folder
    end
    
    it "routes to #index" do
      expect(:get => "/folders/" + @folder.id.to_s + "/file_items").to route_to("file_items#index", :folder_id => @folder.id.to_s)
    end

    it "routes to #new" do
      expect(:get => "/folders/" + @folder.id.to_s + "/file_items/new").to route_to("file_items#new", :folder_id => @folder.id.to_s)
    end

    it "routes to #show" do
      expect(:get => "/folders/" + @folder.id.to_s + "/file_items/" + @file_item.id.to_s).to route_to("file_items#show", :id => @file_item.id.to_s, :folder_id => @folder.id.to_s)
    end

    it "routes to #edit" do
      expect(:get => "/folders/" + @folder.id.to_s + "/file_items/" + @file_item.id.to_s + "/edit").to route_to("file_items#edit", :id => @file_item.id.to_s, :folder_id => @folder.id.to_s)
    end

    it "routes to #create" do
      expect(:post => "/folders/" + @folder.id.to_s + "/file_items").to route_to("file_items#create", :folder_id => @folder.id.to_s)
    end

    it "routes to #update" do
      expect(:put => "/folders/" + @folder.id.to_s + "/file_items/" + @file_item.id.to_s).to route_to("file_items#update", :id => @file_item.id.to_s, :folder_id => @folder.id.to_s)
    end

    it "routes to #destroy" do
      expect(:delete => "/folders/" + @folder.id.to_s + "/file_items/" + @file_item.id.to_s).to route_to("file_items#destroy", :id => @file_item.id.to_s, :folder_id => @folder.id.to_s)
    end

  end
end
