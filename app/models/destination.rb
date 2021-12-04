class Destination < ApplicationRecord
    has_many :pins
    has_many :users, through: :pins
    validates :city, presence: true, uniqueness: true
    validates :country, presence: true
    accepts_nested_attributes_for :pins

    def city_country
        "#{city} || #{country}"
    end

    def number_of_visits
        @destination.size
    end

    scope :order_by_country, -> {order(:country)}      #scope method
    
end
