class Renter < ActiveRecord::Base
  has_and_belongs_to_many :rooms
  has_secure_password
end
