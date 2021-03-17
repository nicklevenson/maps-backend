class Marker < ApplicationRecord
  # has_many :likes, dependent: :destroy
  belongs_to :user

  has_many :marker_maps
  has_many :maps, through: :marker_maps
end
