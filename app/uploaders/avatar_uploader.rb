class AvatarUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path "profile_default.jpg"
  end

  # version :thumb do
  #   process resize_to_fit: [600, 800]
  # end
  
  # version :small do
  #   process resize_to_fit: [100, 100]
  # end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
