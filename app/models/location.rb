class Location < ApplicationRecord
    has_many :activities
    validates :address, presence: true
end
