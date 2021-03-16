class User < ApplicationRecord
  has_many :markers
  has_many :likes
  
end
