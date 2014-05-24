require 'spec_helper'

describe "schools/edit" do
  before(:each) do
    @school = assign(:school, stub_model(School,
      :name => "MyString",
      :building => "MyString",
      :street => "MyString",
      :locality => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :postcode => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit school form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", school_path(@school), "post" do
      assert_select "input#school_name[name=?]", "school[name]"
      assert_select "input#school_building[name=?]", "school[building]"
      assert_select "input#school_street[name=?]", "school[street]"
      assert_select "input#school_locality[name=?]", "school[locality]"
      assert_select "input#school_city[name=?]", "school[city]"
      assert_select "input#school_state[name=?]", "school[state]"
      assert_select "input#school_country[name=?]", "school[country]"
      assert_select "input#school_postcode[name=?]", "school[postcode]"
      assert_select "input#school_phone[name=?]", "school[phone]"
      assert_select "input#school_fax[name=?]", "school[fax]"
      assert_select "input#school_email[name=?]", "school[email]"
      assert_select "textarea#school_notes[name=?]", "school[notes]"
    end
  end
end
