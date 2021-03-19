class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_tour, only: [:clone, :edit, :show, :update, :destroy, :publish, :start]

  def index

    search = params[:location]
    @unfiltered_tours = Tour.all.to_a
    @tours = []
    @locations = []

    if params["search"]
      @filter = params["search"]["tags"].flatten.reject(&:blank?)
      @unfiltered_tours = @filter.empty? ? Tour.all : Tour.all.tagged_with(@filter, any: true)
    else
      @unfiltered_tours = Tour.all
    end

    @unfiltered_tours.each_with_index do |tour, i|
      if !tour.tour_activities.empty?
        location = tour.tour_activities.first.activity.location
        if search.nil? or location.address.include? "#{search}"
          @locations << location
          @tours << tour
        end
      end
    end
    @markers = @locations.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
    # raise
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

  def start
    tour_activity = @tour.tour_activities.first
    tour_activity.start_time = DateTime.now
    tour_activity.save
    #redirect_to tour_path(@tour)
  end

  def clone
    new_tour = @tour.dup
    new_tour.user = current_user
    new_tour.tour = @tour
    new_tour.public = false
    new_tour.save
    clone_tour_activities(@tour.tour_activities, new_tour)
    redirect_to tour_path(new_tour)
  end

  def clone_tour_activities(tour_activities, new_tour)
    tour_activities.each do |ta|
      ta_clone = ta.dup
      ta_clone.tour_id = new_tour.id
      ta_clone.save
    end
  end

  def show
    @activity = Activity.new
    @tour_activities = @tour.tour_activities.sort_by(&:id)
    @locations = []
    @tour.activities.each do |activity|
      @locations << activity.location
    end
    @markers = @locations.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
    @start_time = ''
    if(!@tour_activities.empty?)
      @start_time = @tour_activities.last.start_time
    end
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
    if @tour.tour == nil
      @tour.public = true
      @tour.save
    end
    redirect_to tour_path(@tour)
  end

  private
  def find_tour
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :description, :tag_list)
  end

end
