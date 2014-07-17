class Folder
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  
  validates_presence_of :name

  field :is_workspace, type: Boolean, default: false

  default_scope -> { where(is_workspace: false) }
  scope :workspace, -> { where(is_workspace: true) }
  
  has_many :file_items

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
