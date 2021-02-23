class Activity < ApplicationRecord

    belongs_to :tour_activity
    belongs_to :location
    validates :name, :duration, :description, :requirements, presence: true
end
