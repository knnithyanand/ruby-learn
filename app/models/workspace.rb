class Workspace
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  
  has_one :workspace_membership

  ## Image
  mount_uploader :image, ImageUploader
  
  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end
