class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end
    
  def new
      @tour = Tour.new
  end

  def create
      @tour = Tour.new(tour_params)
      @tour.user = current_user
      @tour.save
      redirect_to tour_path(@tour)
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
