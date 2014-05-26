require 'spec_helper'

describe "courses/new" do
  before(:each) do
    assign(:course, stub_model(Course,
      :code => "MyString",
      :name => "MyString",
      :description => "MyString",
      :type => ""
    ).as_new_record)
  end

  it "renders new course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", courses_path, "post" do
      assert_select "input#course_code[name=?]", "course[code]"
      assert_select "input#course_name[name=?]", "course[name]"
      assert_select "input#course_description[name=?]", "course[description]"
      assert_select "input#course_type[name=?]", "course[type]"
    end
  end
end
