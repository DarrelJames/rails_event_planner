class Guest < ApplicationRecord
  belongs_to :user
  has_many :rsvps, :dependent => :delete_all
  has_many :events, through: :rsvps

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
