class ToursController < ApplicationController
  def show
    @tour = Tour.find(params[:id])
  end
  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to tours_path
  end
end
