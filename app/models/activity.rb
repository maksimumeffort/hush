class Activity < ApplicationRecord
    belongs_to :location
    validates :name, :duration, :description, :requirements, presence: true
end
