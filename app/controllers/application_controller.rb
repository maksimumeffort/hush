class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :new_tour

  @tours = Tour.all

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  private
  
  def new_tour
    @new_tour = Tour.new
  end
end
