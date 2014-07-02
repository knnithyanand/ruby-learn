# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  storage :grid_fs
  def store_dir
    "#{model.class.to_s.underscore}/#{model.id}"
  end

  # def extension_white_list
  #   %w(jpg jpeg gif png pdf doc docx ppt pps pptx xls xlsx)
  # end
end
