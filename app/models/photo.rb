class Photo < ApplicationRecord
  belongs_to :review

  mount_uploader :url, ImagesUploader, allow_destroy: true
end
