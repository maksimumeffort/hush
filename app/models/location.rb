class Location < ApplicationRecord
    has_many :activities
    belongs_to :user
    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
    #validates :longitude, :latitude, :address, presence: true

    def label
        return address
    end
end
