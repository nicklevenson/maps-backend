class User < ApplicationRecord
  has_many :markers
  has_many :likes
  
#users-maps
  # user has many maps
  # maps has many users
#markers-maps
  # maps has many markers
  # markers have many maps 

#maps
  #private or public

#json 
  #allmaps
  #usermaps

  #public-maps
    #Lists all markers belonging to public maps
    #can filter through public maps

  #my-maps
    #filter through a user's maps
    #can add users to a map
  def likedMarkers
    likedMarkers = self.likes.collect{|like| like.marker}
  end
end
