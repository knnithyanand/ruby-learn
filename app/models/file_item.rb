class FileItem
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :is_directory, type: Boolean, default: false
  mount_uploader :file, FileUploader

  belongs_to :folder

  def name
    File.basename(file.to_s, '.*').titleize
  end
  
  def ext
    extname = File.extname(file.to_s).downcase
    extname.last(extname.length - 1)
  end
  
  def icon_path
    icon_dir = 'icons'
    icon_size = '64'
    icon_ext = 'jpg'
    icon_type = self.is_directory ? "folder" : case self.ext
      when "jpg" then "photo"
      when "jpeg" then "photo"
      when "png" then "photo"
      when "gif" then "photo"
      when "bmp" then "photo"
      when "tif" then "photo"
      when "tiff" then "photo"
      when "pdf" then "pdf"
      when "xsl" then "excel"
      when "xslx" then "excel"
      when "xslm" then "excel"
      when "csv" then "excel"
      when "mp3" then "music"
      when "wma" then "music"
      when "wav" then "music"
      when "ogg" then "music"
      when "one" then "onenote"
      when "ppt" then "ppoint"
      when "pptx" then "ppoint"
      when "pps" then "ppoint"
      when "ppsx" then "ppoint"
      when "txt" then "text"
      when "ini" then "text"
      when "xml" then "text"
      when "mpg" then "video"
      when "mpeg" then "video"
      when "mp4" then "video"
      when "wmv" then "video"
      when "mov" then "video"
      when "div" then "video"
      when "rm" then "video"
      when "doc" then "word"
      when "docx" then "word"
      when "zip" then "zip"
      when "rar" then "zip"
      when "7z" then "zip"
      when "tat" then "zip"
      else "file"
    end
    icon_dir + '/' + icon_size + '/' + icon_type + '.' + icon_ext
  end
  
  def created
    Humanize.format_date('created ', created_at)
  end

  def updated
    Humanize.format_date('last updated ', updated_at)
  end
end
