class Tour < ApplicationRecord

    has_many :tours
    has_many :tour_activities
    has_many :bookings
    belongs_to :tour, optional: true

    has_many :activities, through: :tour_activities

    validates :name, :description, presence: true
end
