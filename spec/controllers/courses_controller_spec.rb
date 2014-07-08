require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do

  before :each do
    @admin = create(:admin)
    sign_in @admin
  end
  
  describe "GET index" do
    it "assigns all courses as @courses" do
      course = create(:course)
      get :index, { }
      expect(assigns(:courses)).to eq([course])
    end
  end

  describe "GET show" do
    it "assigns the requested course as @course" do
      course = create(:course)
      get :show, {:id => course.to_param}
      assigns(:course).should eq(course)
    end
  end

  describe "GET new" do
    it "assigns a new course as @course" do
      get :new, {}
      assigns(:course).should be_a_new(Course)
    end
  end

  describe "GET edit" do
    it "assigns the requested course as @course" do
      course = create(:course)
      get :edit, {:id => course.to_param}
      assigns(:course).should eq(course)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Course" do
        expect {
          post :create, {:course => attributes_for(:course)}
        }.to change(Course, :count).by(1)
      end

      it "assigns a newly created course as @course" do
        post :create, {:course => attributes_for(:course)}
        assigns(:course).should be_a(Course)
        assigns(:course).should be_persisted
      end

      it "redirects to the created course" do
        post :create, {:course => attributes_for(:course)}
        response.should redirect_to(Course.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved course as @course" do
        # Trigger the behavior that occurs when invalid params are submitted
        Course.any_instance.stub(:save).and_return(false)
        post :create, {:course => { "code" => "invalid value" }}
        assigns(:course).should be_a_new(Course)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Course.any_instance.stub(:save).and_return(false)
        post :create, {:course => { "code" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested course" do
        course = create(:course)
        # Assuming there are no other courses in the database, this
        # specifies that the Course created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Course.any_instance.should_receive(:update_attributes).with({ "code" => "MyString" })
        put :update, {:id => course.to_param, :course => { "code" => "MyString" }}
      end

      it "assigns the requested course as @course" do
        course = create(:course)
        put :update, {:id => course.to_param, :course => attributes_for(:course)}
        assigns(:course).should eq(course)
      end

      it "redirects to the course" do
        course = create(:course)
        put :update, {:id => course.to_param, :course => attributes_for(:course)}
        response.should redirect_to(course)
      end
    end

    describe "with invalid params" do
      it "assigns the course as @course" do
        course = create(:course)
        # Trigger the behavior that occurs when invalid params are submitted
        Course.any_instance.stub(:save).and_return(false)
        put :update, {:id => course.to_param, :course => { "code" => "invalid value" }}
        assigns(:course).should eq(course)
      end

      it "re-renders the 'edit' template" do
        course = create(:course)
        # Trigger the behavior that occurs when invalid params are submitted
        Course.any_instance.stub(:save).and_return(false)
        put :update, {:id => course.to_param, :course => { "code" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested course" do
      course = create(:course)
      expect {
        delete :destroy, {:id => course.to_param}
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      course = create(:course)
      delete :destroy, {:id => course.to_param}
      response.should redirect_to(courses_url)
    end
  end

end
