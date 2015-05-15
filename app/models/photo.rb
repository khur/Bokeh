class Photo < ActiveRecord::Base
  # require 'carrierwave/orm/activerecord'

  belongs_to :user
  belongs_to :contest

  mount_uploader :image, ImageUploader
end
