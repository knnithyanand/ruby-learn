require 'rails_helper'

RSpec.describe FoldersController, :type => :controller do

  before :each do
    @admin = create(:admin)
    sign_in @admin
  end
  
  describe "GET index" do
    it "assigns all folders as @folders" do
      folder = create(:folder)
      get :index, {}
      expect(assigns(:folders)).to eq([folder])
    end
  end

  describe "GET show" do
    it "assigns the requested folder as @folder" do
      folder = create(:folder)
      get :show, {:id => folder.to_param}
      expect(assigns(:folder)).to eq(folder)
    end
  end

  describe "GET new" do
    it "assigns a new folder as @folder" do
      get :new, {}
      expect(assigns(:folder)).to be_a_new(Folder)
    end
  end

  describe "GET edit" do
    it "assigns the requested folder as @folder" do
      folder = create(:folder)
      get :edit, {:id => folder.to_param}
      expect(assigns(:folder)).to eq(folder)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Folder" do
        expect {
          post :create, {:folder => attributes_for(:folder)}
        }.to change(Folder, :count).by(1)
      end

      it "assigns a newly created folder as @folder" do
        post :create, {:folder => attributes_for(:folder)}
        expect(assigns(:folder)).to be_a(Folder)
        expect(assigns(:folder)).to be_persisted
      end

      it "redirects to the created folder" do
        post :create, {:folder => attributes_for(:folder)}
        expect(response).to redirect_to(Folder.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved folder as @folder" do
        post :create, {:folder => attributes_for(:folder, name: "")}
        expect(assigns(:folder)).to be_a_new(Folder)
      end

      it "re-renders the 'new' template" do
        post :create, {:folder => attributes_for(:folder, name: "")}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested folder" do
        folder = create(:folder)
        put :update, {:id => folder.to_param, :folder => attributes_for(:folder, name: "UPDATED")}
        folder.reload
        expect(folder.name).to eql("UPDATED")
      end

      it "assigns the requested folder as @folder" do
        folder = create(:folder)
        put :update, {:id => folder.to_param, :folder => attributes_for(:folder)}
        expect(assigns(:folder)).to eq(folder)
      end

      it "redirects to the folder" do
        folder = create(:folder)
        put :update, {:id => folder.to_param, :folder => attributes_for(:folder)}
        expect(response).to redirect_to(folder)
      end
    end

    describe "with invalid params" do
      it "assigns the folder as @folder" do
        folder = create(:folder)
        put :update, {:id => folder.to_param, :folder => attributes_for(:folder, name: "")}
        expect(assigns(:folder)).to eq(folder)
      end

      it "re-renders the 'edit' template" do
        folder = create(:folder)
        put :update, {:id => folder.to_param, :folder => attributes_for(:folder, name: "")}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    
    it "destroys the requested folder" do
      folder = create(:folder)
      expect {
        delete :destroy, {:id => folder.to_param}
      }.to change(Folder, :count).by(-1)
    end

    it "redirects to the folders list" do
      folder = create(:folder)
      delete :destroy, {:id => folder.to_param}
      expect(response).to redirect_to(folders_url)
    end
  end

end
