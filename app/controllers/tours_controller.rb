class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
  end
  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    redirect_to tours_path
  end
end
