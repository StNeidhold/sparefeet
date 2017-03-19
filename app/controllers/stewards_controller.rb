class StewardsController < ApplicationController
  def index
    @stewards = Steward.all
  end

  def show
    @steward = Steward.find(params[:id])
  end
end
