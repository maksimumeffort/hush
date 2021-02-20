class Tour < ApplicationRecord
    has_many :tours, :tour_activities, :bookings
    has_many :activities, through: :tour_activities
    belongs_to :tour, :booking
    validates :name, :description, presence: true
end
