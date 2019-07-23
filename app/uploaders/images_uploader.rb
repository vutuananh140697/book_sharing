class ImagesUploader < CarrierWave::Uploader::Base
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
    ActionController::Base.helpers.asset_path "book_default.png"
  end

  # version :thumb do
  #   process resize_to_fit: [600, 800]
  # end
  
  # version :small do
  #   process resize_to_fit: [111, 133]
  # end
  
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
