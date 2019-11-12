class Event < ApplicationRecord
  has_many :rsvps
  has_many :guests, through: :rsvps
  belongs_to :venue

  validates :name, :date, :start_time, :end_time, presence: true

  # accepts_nested_attributes_for :venue

  def venue_attributes=(venue_attributes)
      venue = Venue.find_or_create_by(venue_attributes)
      self.venue = venue
  end
end
