require 'rails_helper'

RSpec.describe "FileItems", :type => :request do
  describe "GET /file_items" do
    it "works! (now write some real specs)" do
      get file_items_path
      expect(response.status).to be(200)
    end
  end
end
