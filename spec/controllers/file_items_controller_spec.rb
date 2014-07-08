require 'rails_helper'

RSpec.describe FileItemsController, :type => :controller do

  before :each do
    @admin = create(:admin)
    @folder = create(:folder)
    @folder.save!
    sign_in @admin
  end
  
  describe "GET index" do
    it "assigns all file_items as @file_items" do
      file_item = create(:file_item_with_folder)
      get :index, { :folder_id => file_item.folder.id }
      expect(assigns(:file_items)).to eq([file_item])
    end
  end


  describe "GET show" do
    it "assigns the requested file_item as @file_item" do
      file_item = create(:file_item_with_folder)
      get :show, { :folder_id => file_item.folder.id, :id => file_item.id }
      expect(assigns(:file_item)).to eq(file_item)
    end
  end

  describe "GET new" do
    it "assigns a new file_item as @file_item" do
      get :new, { :folder_id => @folder.id }
      expect(assigns(:file_item)).to be_a_new(FileItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested file_item as @file_item" do
      file_item = create(:file_item_with_folder)
      get :edit, { :folder_id => file_item.folder.id , :id => file_item.id }
      expect(assigns(:file_item)).to eq(file_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FileItem" do
        expect {
          post :create, { :file_item => attributes_for(:file_item), :folder_id => @folder.id }
        }.to change(FileItem, :count).by(1)
      end

      it "assigns a newly created file_item as @file_item" do
        post :create, { :file_item => attributes_for(:file_item), :folder_id => @folder.id }
        expect(assigns(:file_item)).to be_a(FileItem)
        expect(assigns(:file_item)).to be_persisted
      end

      it "redirects to @folder after creating file_item" do
        post :create, { :file_item => attributes_for(:file_item), :folder_id => @folder.id }
        expect(response).to redirect_to(@folder)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested file_item" do
        file_item = create(:file_item)
        put :update, { :id => file_item.to_param, :file_item => attributes_for(:file_item_with_folder), :folder_id => @folder.id }
        file_item.reload
        expect(file_item.name).to eql(create(:file_item).name)
      end

      it "assigns the requested file_item as @file_item" do
        file_item = create(:file_item)
        put :update, { :id => file_item.to_param, :file_item => attributes_for(:file_item), :folder_id => @folder.id }
        expect(assigns(:file_item)).to eq(file_item)
      end

      it "redirects to the @folder" do
        file_item = create(:file_item)
        put :update, { :id => file_item.to_param, :file_item => attributes_for(:file_item), :folder_id => @folder.id }
        expect(response).to redirect_to(@folder)
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested file_item" do
      file_item = create(:file_item_with_folder)
      expect {
        delete :destroy, { :id => file_item.id, :folder_id => file_item.folder.id }
      }.to change(FileItem, :count).by(-1)
    end

    it "redirects to the @folder" do
      file_item = create(:file_item_with_folder)
      folder = file_item.folder;
      delete :destroy, { :id => file_item.id, :folder_id => file_item.folder.id }
      expect(response).to redirect_to(folder)
    end
  end

end
