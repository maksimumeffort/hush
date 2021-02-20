class Location < ApplicationRecord
    has_many :activities
    validates :longitude, :latitude, :address presence: true
end
