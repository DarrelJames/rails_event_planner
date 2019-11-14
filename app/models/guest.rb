class Guest < ApplicationRecord
  belongs_to :user
  has_many :rsvps, :dependent => :delete_all
  has_many :events, through: :rsvps

  validates :first_name, :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.full_name_nocase(first_name, last_name)
    where("LOWER(first_name) = ? AND LOWER(last_name) = ?", first_name.downcase, last_name.downcase).first
  end

  def self.by_event(event)
    joins(:rsvps).where(rsvps: {event_id: event}).distinct
  end

  def self.alpha
    order(:first_name)
  end
end
