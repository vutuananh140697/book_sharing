class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :photos
  has_many :comments, dependent: :destroy
  has_many :likes

  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :title, presence: true
  
  def count_like
    review = Review.find_by id: self.id
    likes = review.likes
    size = likes.size
    return size
  end
end
