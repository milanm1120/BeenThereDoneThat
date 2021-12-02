class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  validates :rating, numericality: {greater_than: 0, less_than: 6}
  validates :date, presence: true
  accepts_nested_attributes_for :destination

  def destination_attributes=(attr_hash)     #custom writer
      if !attr_hash.empty?
        self.destination = Destination.find_or_create_by(attr_hash)
    end
  end

end
