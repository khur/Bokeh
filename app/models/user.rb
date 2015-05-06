class User < ActiveRecord::Base
  has_many :photos

  validates :name, presence: true
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { in: 3..16 }
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  # validates :password, presence: true, confirmation: true, length: { in: 6..20 }
end
