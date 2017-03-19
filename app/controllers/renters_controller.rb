class RentersController < ApplicationController
  def index
    @renters = Renter.page(params[:page]).per(10)
  end

  def show
    @renter = Renter.find(params[:id])
  end
end
