class StewardsController < ApplicationController
  def index
    @stewards = Steward.page(params[:page]).per(10)
  end

  def show
    @steward = Steward.find(params[:id])
  end
end
