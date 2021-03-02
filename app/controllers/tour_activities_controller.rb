class TourActivitiesController < ApplicationController

  def new
    TourActivity.new(tour_id: tour.id, activity_id: activity.id)
  end

  def create
    TourActivity.new(tour_id: tour.id, activity_id: activity.id)
    TourActivity.save
  end

  def update
  end
  
  def edit
  end
end
