class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  has_many :pins                          #data type is stored as an array
  has_many :destinations, through: :pins
  has_secure_password
end
