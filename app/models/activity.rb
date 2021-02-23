class Activity < ApplicationRecord
    belongs_to :location
    validates :name, :duration, :description, :requirements, presence: true
    before_destroy :check_for_tour_activitites

    private
    def check_for_tour_activitites
        if tour_activities.count > 0
          errors.add_to_base("cannot delete activity as it is linked to tour activities")
          return false
        end
    end
end
