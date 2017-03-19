class ReviewOfLandlordsController < ApplicationController
  before_action :current_user_must_be_review_of_landlord_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_review_of_landlord_renter
    review_of_landlord = ReviewOfLandlord.find(params[:id])

    unless current_user == review_of_landlord.renter
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @review_of_landlords = ReviewOfLandlord.page(params[:page]).per(10)

    render("review_of_landlords/index.html.erb")
  end

  def show
    @review_of_landlord = ReviewOfLandlord.find(params[:id])

    render("review_of_landlords/show.html.erb")
  end

  def new
    @review_of_landlord = ReviewOfLandlord.new

    render("review_of_landlords/new.html.erb")
  end

  def create
    @review_of_landlord = ReviewOfLandlord.new

    @review_of_landlord.renter_id = params[:renter_id]
    @review_of_landlord.landlord_id = params[:landlord_id]
    @review_of_landlord.rental_id = params[:rental_id]
    @review_of_landlord.landlord_rating = params[:landlord_rating]
    @review_of_landlord.landlord_notes = params[:landlord_notes]
    @review_of_landlord.landlord_response = params[:landlord_response]

    save_status = @review_of_landlord.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_of_landlords/new", "/create_review_of_landlord"
        redirect_to("/review_of_landlords")
      else
        redirect_back(:fallback_location => "/", :notice => "Review of landlord created successfully.")
      end
    else
      render("review_of_landlords/new.html.erb")
    end
  end

  def edit
    @review_of_landlord = ReviewOfLandlord.find(params[:id])

    render("review_of_landlords/edit.html.erb")
  end

  def update
    @review_of_landlord = ReviewOfLandlord.find(params[:id])

    @review_of_landlord.renter_id = params[:renter_id]
    @review_of_landlord.landlord_id = params[:landlord_id]
    @review_of_landlord.rental_id = params[:rental_id]
    @review_of_landlord.landlord_rating = params[:landlord_rating]
    @review_of_landlord.landlord_notes = params[:landlord_notes]
    @review_of_landlord.landlord_response = params[:landlord_response]

    save_status = @review_of_landlord.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_of_landlords/#{@review_of_landlord.id}/edit", "/update_review_of_landlord"
        redirect_to("/review_of_landlords/#{@review_of_landlord.id}", :notice => "Review of landlord updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review of landlord updated successfully.")
      end
    else
      render("review_of_landlords/edit.html.erb")
    end
  end

  def destroy
    @review_of_landlord = ReviewOfLandlord.find(params[:id])

    @review_of_landlord.destroy

    if URI(request.referer).path == "/review_of_landlords/#{@review_of_landlord.id}"
      redirect_to("/", :notice => "Review of landlord deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review of landlord deleted.")
    end
  end
end
