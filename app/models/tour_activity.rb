class TourActivity < ApplicationRecord
    belongs_to :tour
    belongs_to :activity

  def clone
    new_tour_activity = self.dup
    new_tour_activity.save!
    new_tour_activity
  end
end
