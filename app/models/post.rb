class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :avatar, AvatarUploader
  
  field :title, type: String
  field :description, type: String
  
  def created
    diff = Integer(Time.now - created_at)
    if diff <= 86400
      case diff
        when 0..5 then "now."
        when 6..60 then "few seconds ago."
        when 61..120 then "a minute ago."
        when 121..3300 then "#{ diff / 60 } minutes ago."
        when 3301..5400 then "about an hour ago."
        else "#{ diff / 3600 } hours ago."
      end
    else
      case diff /= 86400
        when 0..1 then "yesterday."
        when 2..7 then "#{ diff } days ago."
        when 8..13 then "last week."
        when 14..30 then "#{ diff / 7 } weeks ago."
        when 30..60 then "last month."
        else "#{ diff / 30 } months ago."
      end
    end
  end
end
