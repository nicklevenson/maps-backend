class User < ApplicationRecord
  has_many :markers
  has_many :user_maps

  has_many :maps, through: :user_maps
  # has_many :likes

  # def likedMarkers
  #   likedMarkers = self.likes.collect{|like| like.marker}
  # end
end
