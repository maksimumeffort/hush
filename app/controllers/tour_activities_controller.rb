class TourActivitiesController < ApplicationController
  def edit
  end
  
  def show
    @tour_activity = Tour_Activities.find(parmams[:id])
  end
end
