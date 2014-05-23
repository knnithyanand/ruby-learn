class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :description, type: String
  
  has_many :attachments
  
  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end
