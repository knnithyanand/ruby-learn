require 'rails_helper'

RSpec.describe "workspaces/index", :type => :view do
  before(:each) do
    assign(:workspaces, [
      Workspace.create!(),
      Workspace.create!()
    ])
  end

  it "renders a list of workspaces" do
    render
  end
end
