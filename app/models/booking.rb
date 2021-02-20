class Booking < ApplicationRecord
    belongs_to :tour, :user
end
