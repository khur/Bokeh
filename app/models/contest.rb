class Contest < ActiveRecord::Base
  has_many :photos
  belongs_to :user

  validates :name, presence: true
  validates :criteria, presence: true
  
end
