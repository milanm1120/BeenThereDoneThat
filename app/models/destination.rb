class Destination < ApplicationRecord
    has_many :pins
    has_many :users, through: :pins
    validates :city, :country, presence: true 
end
