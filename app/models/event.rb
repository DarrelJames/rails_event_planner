class Event < ApplicationRecord
  has_many :rsvps, dependent: :destroy
  has_many :guests, through: :rsvps
  has_many :faqs
  belongs_to :venue

  validates :name, :date, :start_time, :end_time, presence: true

  # accepts_nested_attributes_for :venue

  def venue_attributes=(venue_attributes)
      venue = Venue.find_or_create_by(venue_attributes)
      self.venue = venue
  end

  def self.by_name(name)
    where('name = ?', name)
  end
end
