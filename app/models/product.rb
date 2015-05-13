class Product < ActiveRecord::Base
  
  validates :description, presence: true
  validates :title, presence: true
  validates :price, presence: true, format: { :with => /\A\d+(?:\.\d{0,2})?\z/}
  
  belongs_to :category
  belongs_to :user
  has_many :reviews
  

  def average_rating
    self.reviews.average(:rating)
  end
  
end
