class User < ApplicationRecord
  has_many :pins
  has_many :destinations, through: :pins
  has_secure_password
end
