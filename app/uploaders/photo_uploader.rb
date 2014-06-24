class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :grid_fs

  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :xsmall do
    process :resize_to_fit => [24, 24]
  end

  version :small do
    process :resize_to_fit => [48, 48]
  end

  version :thumb do
    process :resize_to_fit => [96, 96]
  end

  version :large do
    process :resize_to_fit => [192, 192]
  end

  version :xlarge do
    process :resize_to_fit => [384, 384]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
