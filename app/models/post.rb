class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, type: String
  field :description, type: String
  
  def created
    'created ' + Humanize.format_date(created_at)
  end

  def updated
    'last updated ' + Humanize.format_date(updated_at)
  end
end
