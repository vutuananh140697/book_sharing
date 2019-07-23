class Author < ActiveRecord::Base
  has_many :author_books
  has_many :books, through: :author_books
  
  validates :name, presence: true
  
  mount_uploader :image, AvatarUploader
end
