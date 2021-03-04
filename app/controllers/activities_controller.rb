class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:edit, :show, :update, :destroy]
  # before_destroy :check_for_tour_activitites

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    @activity.save
    @tour = Tour.find(params[:tour_id])
    create_tour_activity(@tour.id, @activity.id)
    redirect_to tour_path(@tour)

    # inside /tours/:id
    # take params - send tour_id to TourActivity + Activity_id to TourActivity

  end

  def create_tour_activity(tour_id, activity_id)
    tour_activity = TourActivity.new(tour_id: tour_id, activity_id: activity_id)
    tour_activity.save
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    redirect_to activities_path
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

  def activity_params
    params.require(:activity).permit(:name, :duration, :description, :requirements, :location_id)
  end
end
