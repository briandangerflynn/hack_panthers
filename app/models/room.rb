class Room < ActiveRecord::Base
  belongs_to :owner
  # has_and_belongs_to_many :renters
end
