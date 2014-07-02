require 'rails_helper'

RSpec.describe "file_items/new", :type => :view do
  before(:each) do
    assign(:file_item, FileItem.new())
  end

  it "renders new file_item form" do
    render

    assert_select "form[action=?][method=?]", file_items_path, "post" do
    end
  end
end
