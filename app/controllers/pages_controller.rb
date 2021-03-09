class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

    def home
        @tours = Tour.all
    end

    def dashboard
    @my_bookings = current_user.tours.where(public: false).where.not(tour_id: nil)

    @my_tour_designs = current_user.tours.where(tour_id: nil)
    end

end
