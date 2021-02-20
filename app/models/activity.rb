class Activity < ApplicationRecord
    belongs_to :tour_activity, :location
    validates :name, :duration, :description, :requirements, presence: true
end
