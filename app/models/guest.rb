class Guest < ApplicationRecord
  belongs_to :user
  has_many :rsvps
  has_many :events, through: :rsvps
end
