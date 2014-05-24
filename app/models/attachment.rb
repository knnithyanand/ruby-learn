class Attachment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :file, FileUploader

  belongs_to :post
  
  def icon
    '<i class="fa fa-file-o"></i>'
  end

  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end