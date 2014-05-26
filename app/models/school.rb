class School
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :building, type: String
  field :street, type: String
  field :locality, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String
  field :postcode, type: String
  field :phone, type: String
  field :fax, type: String
  field :currency, type: String
  field :email, type: String
  field :notes, type: String
  
  validates_presence_of :name, :phone, :email
  validates_uniqueness_of :name, :phone, :email, :case_sensitive => false

  ## Image
  mount_uploader :image, ImageUploader
  
  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end
