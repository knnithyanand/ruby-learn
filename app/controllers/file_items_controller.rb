class FileItemsController < ApplicationController
  # GET /file_items
  # GET /file_items.json
  def index
    @folder = Folder.find(params[:folder_id])
    @file_items = @folder.file_items.page(params[:page]).per(15)
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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @file_item }
    end
  end

  # GET /file_items/new
  # GET /file_items/new.json
  def new
    @file_item = FileItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @file_item }
    end
  end

  # GET /file_items/1/edit
  def edit
    @file_item = FileItem.find(params[:id])
  end

  # POST /file_items
  # POST /file_items.json
  def create
    @folder = Folder.find(params[:folder_id])
    @file_item = FileItem.new(params[:file_item])
    @file_item.folder = @folder
    @file_item.save
  end

  # PUT /file_items/1
  # PUT /file_items/1.json
  def update
    @file_item = FileItem.find(params[:id])

    respond_to do |format|
      if @file_item.update_attributes(params[:file_item])
        format.html { redirect_to @file_item, notice: 'File item was successfully updated.' }
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
    @file_item = FileItem.find(params[:id])
    @file_item.destroy

    respond_to do |format|
      format.html { redirect_to file_items_url }
      format.json { head :no_content }
    end
  end
end
