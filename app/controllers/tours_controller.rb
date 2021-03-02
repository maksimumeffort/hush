class ToursController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_tour, only: [:clone, :edit, :show, :update, :destroy, :publish]

  def index
    @tours = Tour.all
    @activities = []
    @tours.each_with_index do |tour, i|
      if i < 10
      @locations << tour.tour_activities.first.activity
      end
    end
    # @locations.geocoded.map do |t|
    #     {
    #       lat: t.latitude,
    #       lng: t.longitude
    #     }
    #   end
  end

  def new
      @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user_id = current_user.id
    @tour.save
    redirect_to tour_path(@tour)
  end

  def clone
    @tour.clone

  end


  def show
  end

  def edit
  end

  def update
    @tour.update(tour_params)
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour.destroy
    redirect_to tours_path
  end

  def publish
    @tour.public = true
    @tour.save
    redirect_to tour_path(@tour)
  end

  private
  def find_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :description)
  end
end
