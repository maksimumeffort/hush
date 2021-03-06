class Tour < ApplicationRecord

    acts_as_taggable_on :tags

    has_many :tours, dependent: :destroy
    has_many :tour_activities, dependent: :destroy
    belongs_to :tour, optional: true
    belongs_to :user

    has_many :activities, through: :tour_activities

    validates :name, :description, presence: true

    $filters = ['History', 'Art', 'Food', 'Music','Outdoor','Family','Grownups','Disabled','Pets','Fitness','Adventure','Fashion', 'Beauty','Animals','Books','Friends','Plants','Farming']

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
