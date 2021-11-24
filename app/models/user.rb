class User < ApplicationRecord
  has_many :pins                          #data type is stored as an array
  has_many :destinations, through: :pins
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validate :valid_email?
end

#custom methods

def valid_email?
  if !email.match(/\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    errors.add(:email, "Invalid, Please Try Again")
  end
end