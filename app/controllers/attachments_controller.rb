class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.json
  def index
    post = Post.find(params[:post_id])
    @attachments = post.attachments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.json
  def new
    @attachment = Attachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attachment }
    end
  end

  # GET /attachments/1/edit
  def edit
    @attachment = Attachment.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.json
  def create
    @post = Post.find(params[:post_id])
    @attachment = Attachment.new(params[:attachment])
    @post.attachments << @attachment

    respond_to do |format|
      @post.save
      if @attachment.save
        format.html { redirect_to @post, notice: 'Attachment was successfully created.' }
        format.json { render json: @post, status: :created, location: @attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.json
  def update
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      if @attachment.update_attributes(params[:attachment])
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @attachment = @post.attachments.find(params[:id])
    @post.attachments.delete(@attachment)

    respond_to do |format|
      format.html { redirect_to post_attachments_url }
      format.json { head :no_content }
    end
  end
end
