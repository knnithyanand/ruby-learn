require 'rails_helper'

RSpec.describe ProfilesController, :type => :controller do

  before :each do
    @admin = create(:admin)
    sign_in @admin
  end

  describe "GET index" do
    it "assigns all profiles as @profiles" do
      get :index, {}
      expect(assigns(:profiles)).to eq([@admin.profile])
    end
  end

  describe "GET show" do
    it "assigns the requested profile as @profile" do
      profile = create(:profile)
      get :show, {:id => profile.to_param}
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe "GET new" do
    it "assigns a new profile as @profile" do
      get :new, {}
      expect(assigns(:profile)).to be_a_new(Profile)
    end
  end

  describe "GET edit" do
    it "assigns the requested profile as @profile" do
      profile = create(:profile)
      get :edit, {:id => profile.to_param}
      expect(assigns(:profile)).to eq(profile)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Profile" do
        expect {
          post :create, {:profile => attributes_for(:profile)}
        }.to change(Profile, :count).by(1)
      end

      it "assigns a newly created profile as @profile" do
        post :create, {:profile => attributes_for(:profile)}
        expect(assigns(:profile)).to be_a(Profile)
        expect(assigns(:profile)).to be_persisted
      end

      it "redirects to homepage after create" do
        post :create, {:profile => attributes_for(:profile)}
        expect(response).to redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved profile as @profile" do
        post :create, {:profile => attributes_for(:profile_invalid)}
        expect(assigns(:profile)).to be_a_new(Profile)
      end

      it "re-renders the 'new' template" do
        post :create, {:profile => attributes_for(:profile_invalid)}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do

      it "updates the requested profile" do
        profile = create(:profile)
        put :update, {:id => profile.to_param, :profile => attributes_for(:profile, middle_name: "UPDATED")}
        profile.reload
        expect(profile.middle_name).to eql("UPDATED")
      end

      it "assigns the requested profile as @profile" do
        profile = create(:profile)
        put :update, {:id => profile.to_param, :profile => attributes_for(:profile)}
        expect(assigns(:profile)).to eq(profile)
      end

      it "redirects to the profile" do
        profile = create(:profile)
        put :update, {:id => profile.to_param, :profile => attributes_for(:profile)}
        expect(response).to redirect_to(profile)
      end
    end

    describe "with invalid params" do
      it "assigns the profile as @profile" do
        profile = create(:profile)
        put :update, {:id => profile.to_param, :profile => attributes_for(:profile_invalid)}
        expect(assigns(:profile)).to eq(profile)
      end

      it "re-renders the 'edit' template" do
        profile = create(:profile)
        put :update, {:id => profile.to_param, :profile => attributes_for(:profile_invalid)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested profile" do
      profile = create(:profile)
      expect {
        delete :destroy, {:id => profile.to_param}
      }.to change(Profile, :count).by(-1)
    end

    it "redirects to the profiles list" do
      profile = create(:profile)
      delete :destroy, {:id => profile.to_param}
      expect(response).to redirect_to(profiles_url)
    end
  end

end
