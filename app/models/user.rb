class User < ApplicationRecord
  has_many :pins                          #data type is stored as an array
  has_many :destinations, through: :pins
  has_secure_password
end
