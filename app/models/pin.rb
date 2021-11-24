class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  validates :rating, numericality: {greater_than: 0, less_than: 6}
end
