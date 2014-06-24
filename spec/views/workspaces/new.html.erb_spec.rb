require 'rails_helper'

RSpec.describe "workspaces/new", :type => :view do
  before(:each) do
    assign(:workspace, Workspace.new())
  end

  it "renders new workspace form" do
    render

    assert_select "form[action=?][method=?]", workspaces_path, "post" do
    end
  end
end
