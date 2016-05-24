class Owner < ActiveRecord::Base
  # has_many :rooms
  # has_many :renters, through: :rooms
  has_secure_password
end
