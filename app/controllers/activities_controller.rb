class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:edit, :show, :update, :destroy]

  def new
  end

  def edit
  end

  def update
    @activity.update(activity_params)
    redirect_to activities_path
  end

  def find_activity
    @activity = Activity.find(params[:id])
  end
end
