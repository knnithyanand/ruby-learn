require 'rails_helper'

RSpec.describe UserRolesController, :type => :controller do

  before :each do
    @admin = create(:admin)
    sign_in @admin
  end

  describe "GET index" do
    it "assigns all user_roles as @user_roles" do
      get :index, {}
      expect(assigns(:user_roles)).to eq(@admin.profile.user_roles)
    end
  end

  describe "GET show" do
    it "assigns the requested user_role as @user_role" do
      user_role = create(:user_role)
      get :show, {:id => user_role.to_param}
      expect(assigns(:user_role)).to eq(user_role)
    end
  end

  describe "GET new" do
    it "assigns a new user_role as @user_role" do
      get :new, {}
      expect(assigns(:user_role)).to be_a_new(UserRole)
    end
  end

  describe "GET edit" do
    it "assigns the requested user_role as @user_role" do
      user_role = create(:user_role)
      get :edit, {:id => user_role.to_param}
      expect(assigns(:user_role)).to eq(user_role)
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
        expect(assigns(:user_role)).to be_a(UserRole)
        expect(assigns(:user_role)).to be_persisted
      end

      it "redirects to the created user_role" do
        post :create, {:user_role => attributes_for(:user_role)}
        expect(response).to redirect_to(UserRole.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user_role as @user_role" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserRole.any_instance.stub(:save).and_return(false)
        post :create, {:user_role => attributes_for(:user_role_invalid)}
        expect(assigns(:user_role)).to be_a_new(UserRole)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        UserRole.any_instance.stub(:save).and_return(false)
        post :create, {:user_role => attributes_for(:user_role_invalid)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user_role" do
        user_role = create(:user_role)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role, name: "UPDATED")}
        user_role.reload
        expect(user_role.name).to eql("UPDATED")
      end

      it "assigns the requested user_role as @user_role" do
        user_role = create(:user_role)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role)}
        expect(assigns(:user_role)).to eq(user_role)
      end

      it "redirects to the user_role" do
        user_role = create(:user_role)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role)}
        expect(response).to redirect_to(user_role)
      end
    end

    describe "with invalid params" do
      it "assigns the user_role as @user_role" do
        user_role = create(:user_role)
        # Trigger the behavior that occurs when invalid params are submitted
        UserRole.any_instance.stub(:save).and_return(false)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role_invalid)}
        expect(assigns(:user_role)).to eq(user_role)
      end

      it "re-renders the 'edit' template" do
        user_role = create(:user_role)
        # Trigger the behavior that occurs when invalid params are submitted
        UserRole.any_instance.stub(:save).and_return(false)
        put :update, {:id => user_role.to_param, :user_role => attributes_for(:user_role_invalid)}
        expect(response).to render_template("edit")
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
      expect(response).to redirect_to(user_roles_url)
    end
  end

end
