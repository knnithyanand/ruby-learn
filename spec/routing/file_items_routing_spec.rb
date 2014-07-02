require "rails_helper"

RSpec.describe FileItemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/file_items").to route_to("file_items#index")
    end

    it "routes to #new" do
      expect(:get => "/file_items/new").to route_to("file_items#new")
    end

    it "routes to #show" do
      expect(:get => "/file_items/1").to route_to("file_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/file_items/1/edit").to route_to("file_items#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/file_items").to route_to("file_items#create")
    end

    it "routes to #update" do
      expect(:put => "/file_items/1").to route_to("file_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/file_items/1").to route_to("file_items#destroy", :id => "1")
    end

  end
end
