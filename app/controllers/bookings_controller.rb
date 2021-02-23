class BookingsController < ApplicationController

before_create :clone_tour, if: [:new, :create]

def new
  @booking = Booking.new
end

def create
  @booking = Booking.new(booking_params)
  @booking.user = current_user
  @booking.tour_id = params[:tour_id]
  @booking.save
end

def clone_tour
  new_tour = tour.dup
  new_tour.user = user
  new_tour.save
  self.tour = new_tour
end

private

def booking_params
  params.require(:booking).permit()
end

end
