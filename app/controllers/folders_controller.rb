class FoldersController < ApplicationController
  # GET /folders
  # GET /folders.json
  def index
    @folders = Folder.all
    authorize! :read, @folders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folders }
    end
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    @folder = Folder.find(params[:id])
    authorize! :read, @folder

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
    @folder = Folder.new
    authorize! :create, @folder

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.find(params[:id])
    authorize! :update, @folder
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(params[:folder])
    authorize! :create, @folder

    enrollment = Enrollment.new(role: "owner", profile: current_user.profile)
    file_item = FileItem.new()
    @folder.items = [ file_item ]
    raise @folder.to_yaml
    @folder.enrollments.push(enrollment)
    
    respond_to do |format|
      if @folder.save and enrollment.save and attachment.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        format.json { render json: @folder, status: :created, location: @folder }
      else
        format.html { render action: "new" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /folders/1
  # PUT /folders/1.json
  def update
    @folder = Folder.find(params[:id])
    authorize! :update, @folder

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        raise @folder.to_yaml
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder = Folder.find(params[:id])
    authorize! :destroy, @folder
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :no_content }
    end
  end
end
