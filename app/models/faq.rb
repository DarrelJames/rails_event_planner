class Faq < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :question, :answer, presence: true

end
