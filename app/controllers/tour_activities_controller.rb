class TourActivitiesController < ApplicationController
  before_action :find_tour_activity, only: [:finish]
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def finish
    @tour_activity.finish_time = DateTime.now
    @tour_activity.save
    # respond_to do |format| 
    #   format.js
    # end
    #render :partial => 'step-container', :content_type => 'text/html'
    redirect_to tour_path(@tour_activity.tour)
  end

  private
  def find_tour_activity
    @tour_activity = TourActivity.find(params[:id])
  end
end
