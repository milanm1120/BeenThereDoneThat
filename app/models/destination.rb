class Destination < ApplicationRecord
    has_many :pins
    has_many :users, through: :pins
    validates :city, :country, presence: true
    accepts_nested_attributes_for :pins

    def city_country
        "#{self.city}, #{self.country}"
    end
end
