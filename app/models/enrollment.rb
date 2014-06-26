class Enrollment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :profile
  belongs_to :enrollable, polymorphic: true
  field :role, type: String

  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end
