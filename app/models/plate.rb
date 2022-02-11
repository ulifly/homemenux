class Plate < ApplicationRecord
  has_many :ingredients
  mount_uploader :image, ImageUploader
  serialize :images, JSON # If you use SQLite, add this line.check CarrierWave documentation
  belongs_to :user, optional: true
  validates :name, presence: true

end
