require 'rails_helper'

RSpec.describe "file_items/index", :type => :view do
  before(:each) do
    assign(:file_items, [
      FileItem.create!(),
      FileItem.create!()
    ])
  end

  it "renders a list of file_items" do
    render
  end
end
