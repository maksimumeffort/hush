class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.create
  end

  def edit

  end

  def location_params
    params.require(:location).permit(:longitude, :latitude, :address)
  end
end
