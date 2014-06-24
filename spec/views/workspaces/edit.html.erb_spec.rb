require 'rails_helper'

RSpec.describe "workspaces/edit", :type => :view do
  before(:each) do
    @workspace = assign(:workspace, Workspace.create!())
  end

  it "renders the edit workspace form" do
    render

    assert_select "form[action=?][method=?]", workspace_path(@workspace), "post" do
    end
  end
end
