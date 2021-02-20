class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update, :destroy]

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.save
    redirect_to locations_path(@location)
  end

  def edit

  end

  def location_params
    params.require(:location).permit(:longitude, :latitude, :address)
  end

  def update
    @location.update(location_params)
    redirect_to locations_path(@location)
  end

  private 

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :address, :opening_time, :closing_time)
  end
end
