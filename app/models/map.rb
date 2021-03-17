class Map < ApplicationRecord
  has_many :marker_maps
  has_many :user_maps

  has_many :markers, through: :marker_maps
  has_many :users, through: :user_maps
end
