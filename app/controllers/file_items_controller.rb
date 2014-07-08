class FileItemsController < ApplicationController
  # GET /file_items
  # GET /file_items.json
  def index
    @folder = Folder.find(params[:folder_id])
    authorize! :read, @folder
    @file_items = Kaminari.paginate_array(@folder.file_items).page(params[:page]).per(15)
    authorize! :read, @file_items
    @file_item = FileItem.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @file_items }
    end
  end

  # GET /file_items/1
  # GET /file_items/1.json
  def show
    @file_item = FileItem.find(params[:id])
    authorize! :read, @file_item

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @file_item }
    end
  end

  # GET /file_items/new
  # GET /file_items/new.json
  def new
    @folder = Folder.find(params[:folder_id])
    authorize! :update, @folder
    @file_item = FileItem.new
    authorize! :create, @file_item

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @file_item }
    end
  end

  # GET /file_items/1/edit
  def edit
    @file_item = FileItem.find(params[:id])
    authorize! :update, @file_item
  end

  # POST /file_items
  # POST /file_items.json
  def create
    @folder = Folder.find(params[:folder_id])
    authorize! :update, @folder
    @file_item = FileItem.new(params[:file_item])
    @file_item.folder = @folder
    authorize! :create, @file_item
        
    respond_to do |format|
      if @file_item.save
        format.html { redirect_to @folder, notice: 'File has been successfully uploaded.' }
        format.json { render json: @file_item, status: :created, location: @folder }
      else
        format.html { render action: "new" }
        format.json { render json: @file_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /file_items/1
  # PUT /file_items/1.json
  def update
    @folder = Folder.find(params[:folder_id])
    authorize! :update, @folder
    @file_item = FileItem.find(params[:id])
    authorize! :update, @file_item

    respond_to do |format|
      if @file_item.update_attributes(params[:file_item])
        format.html { redirect_to @folder, notice: 'File was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @file_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_items/1
  # DELETE /file_items/1.json
  def destroy
    @folder = Folder.find(params[:folder_id])
    authorize! :update, @folder
    @file_item = FileItem.find(params[:id])
    authorize! :destroy, @file_item
    @file_item.destroy

    respond_to do |format|
      format.html { redirect_to @folder }
      format.json { head :no_content }
    end
  end
end
