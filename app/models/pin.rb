class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  validates :rating, numericality: {greater_than: 0, less_than: 6}
  validates :date, presence: true
  # accepts_nested_attributes_for :destination

  def destinations_attributes=(destinations_attributes)     #custom writer
    destinations_attributes.values.each do |destination|
      if !destination[:name].empty?
        self.destination = Destination.find_or_create_by(country: caterogy[:name])
      end
    end
  end

end
