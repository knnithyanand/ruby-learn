require 'spec_helper'

describe "schools/index" do
  before(:each) do
    assign(:schools, [
      stub_model(School,
        :name => "Name",
        :building => "Building",
        :street => "Street",
        :locality => "Locality",
        :city => "City",
        :state => "State",
        :country => "Country",
        :postcode => "Postcode",
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email",
        :notes => "MyText"
      ),
      stub_model(School,
        :name => "Name",
        :building => "Building",
        :street => "Street",
        :locality => "Locality",
        :city => "City",
        :state => "State",
        :country => "Country",
        :postcode => "Postcode",
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of schools" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Building".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Locality".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
