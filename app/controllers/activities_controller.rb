class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.save
    # redirect_to tour_path(@activity.tour_activity.tour)
  end

  def edit
  end

  def activity_params
    params.require(:activity).permit(:name, :duration, :description, :requirements)
  end
end
