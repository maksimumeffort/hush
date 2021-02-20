class Booking < ApplicationRecord
    before_create :clone_tour, if: [:new, :create]
    belongs_to :tour
    belongs_to :user

    def clone_tour
      new_tour = tour.dup
      new_tour.user = user
      new_tour.save
      self.tour = new_tour
    end
end
