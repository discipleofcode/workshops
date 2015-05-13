class Review < ActiveRecord::Base
  
  validates :rating, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
  
  belongs_to :product
  belongs_to :user
end
