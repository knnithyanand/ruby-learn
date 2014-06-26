class Folder
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  
  has_many :enrollments, as: :enrollable
  
  ## Image
  mount_uploader :photo, PhotoUploader
  
  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end
