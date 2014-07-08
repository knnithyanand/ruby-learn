require 'rails_helper'

RSpec.describe UserRolesController, :type => :controller do

  before :each do
    @admin = create(:admin)
    sign_in @admin
  end

  describe "GET index" do
    it "assigns all user_roles as @user_roles" do
      get :index, {}
      assigns(:user_roles).should eq(@admin.profile.user_roles)
    end
  end

  describe "GET show" do
    it "assigns the requested user_role as @user_role" do
      user_role = create(:user_role)
      get :show, {:id => user_role.to_param}
      assigns(:user_role).should eq(user_role)
    end
  end

  describe "GET new" do
    it "assigns a new user_role as @user_role" do
      get :new, {}
      assigns(:user_role).should be_a_new(UserRole)
    end
  end

  describe "GET edit" do
    it "assigns the requested user_role as @user_role" do
      user_role = create(:user_role)
      get :edit, {:id => user_role.to_param}
      assigns(:user_role).should eq(user_role)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new UserRole" do
        expect {
          post :create, {:user_role => attributes_for(:user_role)}
        }.to change(UserRole, :count).by(1)
      end

      it "assigns a newly created user_role as @user_role" do
        post :create, {:user_role => attributes_for(:user_role)}
        assigns(:user_role).should be_a(UserRole)
        assigns(:user_role).should be_persisted
      end

      it "redirects to the created user_role" do
        post :create, {:user_role => attributes_for(:user_role)}
        response.should redirect_to(UserRole.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user_role as @user_role" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserRole.any_instance.stub(:save).and_return(false)
        post :create, {:user_role => attributes_for(:user_role_invalid)}
        assigns(:user_role).should be_a_new(UserRole)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserRole.any_instance.stub(:save).and_return(false)
        post :create, {:user_role => attributes_for(:user_role_invalid)}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user_role" do
        user_role = create(:user_role)
        # Assuming there are no other user_roles in the database, this
        # specifies that the UserRole created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        UserRole.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => user_role.to_param, :user_role => { "name" => "MyString" }}
      end

      it "assigns the requested user_role as @user_role" do
        user_role = create(:user_role)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role)}
        assigns(:user_role).should eq(user_role)
      end

      it "redirects to the user_role" do
        user_role = create(:user_role)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role)}
        response.should redirect_to(user_role)
      end
    end

    describe "with invalid params" do
      it "assigns the user_role as @user_role" do
        user_role = create(:user_role)
        # Trigger the behavior that occurs when invalid params are submitted
        UserRole.any_instance.stub(:save).and_return(false)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role_invalid)}
        assigns(:user_role).should eq(user_role)
      end

      it "re-renders the 'edit' template" do
        user_role = create(:user_role)
        # Trigger the behavior that occurs when invalid params are submitted
        UserRole.any_instance.stub(:save).and_return(false)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role_invalid)}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user_role" do
      user_role = create(:user_role)
      expect {
        delete :destroy, {:id => user_role.to_param}
      }.to change(UserRole, :count).by(-1)
    end

    it "redirects to the user_roles list" do
      user_role = create(:user_role)
      delete :destroy, {:id => user_role.to_param}
      response.should redirect_to(user_roles_url)
    end
  end

end
