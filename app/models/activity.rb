class Activity < ApplicationRecord

    has_many :tour_activities
    belongs_to :location
    belongs_to :user
    validates :name, :duration, :description, :requirements, presence: true
end
