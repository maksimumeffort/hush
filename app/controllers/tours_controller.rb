class ToursController < ApplicationController
    # skip_before_action :authenticate_user!, only: [:index, :show]
    # before_action :find_tour, only: [:edit, :show, :update, :destroy]
    
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
end
