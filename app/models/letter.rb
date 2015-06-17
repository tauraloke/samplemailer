require 'carrierwave/orm/activerecord'

class Letter < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :message, presence: true
end
