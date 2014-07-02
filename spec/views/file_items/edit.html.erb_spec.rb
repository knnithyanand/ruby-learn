require 'rails_helper'

RSpec.describe "file_items/edit", :type => :view do
  before(:each) do
    @file_item = assign(:file_item, FileItem.create!())
  end

  it "renders the edit file_item form" do
    render

    assert_select "form[action=?][method=?]", file_item_path(@file_item), "post" do
    end
  end
end
