class Contest < ActiveRecord::Base
  has_many :photos, dependent: :nullify
  belongs_to :user

  validates :name, presence: true
  validates :criteria, presence: true
  
end
