class PagesController < ApplicationController
    skip_before_action :authenticate_user!, only: :home

    def home
        @tours = Tour.all
    end

    def dashboard
    
        @my_tours = current_user.tours
      end
end