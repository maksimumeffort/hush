class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def new
  end

  def edit
  end

  def update
    @location.update(location_params)
    redirect_to location_path(@location)
  end

  private 

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :address, :opening_time, :closing_time)
  end
end
