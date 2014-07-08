require 'rails_helper'

RSpec.describe SchoolsController, :type => :controller do

  before :each do
    @admin = create(:admin)
    sign_in @admin
  end

  describe "GET index" do
    it "assigns all schools as @schools" do
      school = create(:school)
      get :index, {}
      assigns(:schools).should eq([school])
    end
  end

  describe "GET show" do
    it "assigns the requested school as @school" do
      school = create(:school)
      get :show, {:id => school.to_param}
      assigns(:school).should eq(school)
    end
  end

  describe "GET new" do
    it "assigns a new school as @school" do
      get :new, {}
      assigns(:school).should be_a_new(School)
    end
  end

  describe "GET edit" do
    it "assigns the requested school as @school" do
      school = create(:school)
      get :edit, {:id => school.to_param}
      assigns(:school).should eq(school)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new School" do
        expect {
          post :create, {:school => attributes_for(:school)}
        }.to change(School, :count).by(1)
      end

      it "assigns a newly created school as @school" do
        post :create, {:school => attributes_for(:school)}
        assigns(:school).should be_a(School)
        assigns(:school).should be_persisted
      end

      it "redirects to the created school" do
        post :create, {:school => attributes_for(:school)}
        response.should redirect_to(School.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved school as @school" do
        # Trigger the behavior that occurs when invalid params are submitted
        School.any_instance.stub(:save).and_return(false)
        post :create, {:school => attributes_for(:school_invalid)}
        assigns(:school).should be_a_new(School)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        School.any_instance.stub(:save).and_return(false)
        post :create, {:school => attributes_for(:school_invalid)}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested school" do
        school = create(:school)
        # Assuming there are no other schools in the database, this
        # specifies that the School created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        School.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => school.to_param, :school => { "name" => "MyString" }}
      end

      it "assigns the requested school as @school" do
        school = create(:school)
        put :update, {:id => school.to_param, :school => attributes_for(:school)}
        assigns(:school).should eq(school)
      end

      it "redirects to the school" do
        school = create(:school)
        put :update, {:id => school.to_param, :school => attributes_for(:school)}
        response.should redirect_to(school)
      end
    end

    describe "with invalid params" do
      it "assigns the school as @school" do
        school = create(:school)
        # Trigger the behavior that occurs when invalid params are submitted
        School.any_instance.stub(:save).and_return(false)
        put :update, {:id => school.to_param, :school => attributes_for(:school_invalid)}
        assigns(:school).should eq(school)
      end

      it "re-renders the 'edit' template" do
        school = create(:school)
        # Trigger the behavior that occurs when invalid params are submitted
        School.any_instance.stub(:save).and_return(false)
        put :update, {:id => school.to_param, :school => attributes_for(:school_invalid)}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested school" do
      school = create(:school)
      expect {
        delete :destroy, {:id => school.to_param}
      }.to change(School, :count).by(-1)
    end

    it "redirects to the schools list" do
      school = create(:school)
      delete :destroy, {:id => school.to_param}
      response.should redirect_to(schools_url)
    end
  end

end
