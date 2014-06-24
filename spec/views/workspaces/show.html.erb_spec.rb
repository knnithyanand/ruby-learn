require 'rails_helper'

RSpec.describe "workspaces/show", :type => :view do
  before(:each) do
    @workspace = assign(:workspace, Workspace.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
