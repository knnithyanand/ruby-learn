require 'spec_helper'

describe "schools/show" do
  before(:each) do
    @school = assign(:school, stub_model(School,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Building/)
    rendered.should match(/Street/)
    rendered.should match(/Locality/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Country/)
    rendered.should match(/Postcode/)
    rendered.should match(/Phone/)
    rendered.should match(/Fax/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
  end
end
