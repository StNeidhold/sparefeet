class ApplicationController < ActionController::Base
  before_action :authenticate_renter!

  protect_from_forgery with: :exception
end
