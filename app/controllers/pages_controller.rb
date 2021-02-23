class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

    def home
        # @tours = Tour.all
    
        # @markers = @tours.geocoded.map do |act|
        # {
        #     lat: ins.latitude,
        #     lng: ins.longitude
        # }
        # end
    end
end