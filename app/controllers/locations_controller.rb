class LocationsController < ApplicationController
  def new
  end

  def edit
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end
end

