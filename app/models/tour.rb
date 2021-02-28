class Tour < ApplicationRecord

    has_many :tours, dependent: :destroy
    has_many :tour_activities
    belongs_to :tour, optional: true
    belongs_to :user

    has_many :activities, through: :tour_activities

    validates :name, :description, presence: true

  def clone
    new_tour = self.dup
    new_tour.user = user
    new_tour.tour = self
    new_tour.save!
    cloned_tour_activities(new_tour)
    new_tour
  end

  private

  def cloned_tour_activities(tour)
    self.tour_activities.each do |tour_activity|
      cloned_tour_activity = tour_activity.clone
      cloned_tour_activity.update(tour_id: tour.id)
    end
  end
end
