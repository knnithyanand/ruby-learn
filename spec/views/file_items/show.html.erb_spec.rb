require 'rails_helper'

RSpec.describe "file_items/show", :type => :view do
  before(:each) do
    @file_item = assign(:file_item, FileItem.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
