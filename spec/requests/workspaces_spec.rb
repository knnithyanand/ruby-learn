require 'rails_helper'

RSpec.describe "Workspaces", :type => :request do
  describe "GET /workspaces" do
    it "works! (now write some real specs)" do
      get workspaces_path
      expect(response.status).to be(200)
    end
  end
end
