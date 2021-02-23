class Location < ApplicationRecord
    has_many :activities
    belongs_to :user

    validates :longitude, :latitude, :address, presence: true

end
