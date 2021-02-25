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
    # self.tour = new_tour
    new_tour.save
 end
end
