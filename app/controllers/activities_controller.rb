class ActivitiesController < ApplicationController
  before_action :find_tour, only: [:edit, :update, :destroy]
  before_destroy :check_for_tour_activitites

  def new
  end

  def edit
  end

  def destroy
    @activity.destroy
    redirect_to tour_path(@activity.tour_activity.tour)
  end

  private 
  def find_activity
    @activity = Activity.find(params[:id])
  end

  def check_for_tour_activitites
    if @activity.tour_activities.count > 0
      errors.add_to_base("cannot delete activity as it is linked to tour activities")
      return false
    end
  end

end
