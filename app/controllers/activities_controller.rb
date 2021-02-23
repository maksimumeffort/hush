class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:edit, :show, :update, :destroy]

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
  
  def activity_params
    params.require(:activity).permit(:name, :duration, :description, :requirements)
  end
end
