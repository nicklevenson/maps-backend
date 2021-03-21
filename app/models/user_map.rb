class UserMap < ApplicationRecord
  belongs_to :user 
  belongs_to :map

  default_scope {order(created_at: :asc)}
end
