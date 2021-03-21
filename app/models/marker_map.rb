class MarkerMap < ApplicationRecord
  belongs_to :marker 
  belongs_to :map 
  
end
