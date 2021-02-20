class Tour < ApplicationRecord
    has_many :tours
    has_many :tour_activities
    has_many :bookings
    # has_many :activities, through: :tour_activities
    belongs_to :tour, optional: true
    validates :name, :description, presence: true
end
