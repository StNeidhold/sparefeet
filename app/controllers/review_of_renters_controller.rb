class ReviewOfRentersController < ApplicationController
  def index
    @review_of_renters = ReviewOfRenter.page(params[:page]).per(10)

    render("review_of_renters/index.html.erb")
  end

  def show
    @review_of_renter = ReviewOfRenter.find(params[:id])

    render("review_of_renters/show.html.erb")
  end

  def new
    @review_of_renter = ReviewOfRenter.new

    render("review_of_renters/new.html.erb")
  end

  def create
    @review_of_renter = ReviewOfRenter.new

    @review_of_renter.renter_id = params[:renter_id]
    @review_of_renter.landlord_id = params[:landlord_id]
    @review_of_renter.rental_id = params[:rental_id]
    @review_of_renter.renter_rating = params[:renter_rating]
    @review_of_renter.renter_notes = params[:renter_notes]
    @review_of_renter.renter_response = params[:renter_response]

    save_status = @review_of_renter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_of_renters/new", "/create_review_of_renter"
        redirect_to("/review_of_renters")
      else
        redirect_back(:fallback_location => "/", :notice => "Review of renter created successfully.")
      end
    else
      render("review_of_renters/new.html.erb")
    end
  end

  def edit
    @review_of_renter = ReviewOfRenter.find(params[:id])

    render("review_of_renters/edit.html.erb")
  end

  def update
    @review_of_renter = ReviewOfRenter.find(params[:id])

    @review_of_renter.renter_id = params[:renter_id]
    @review_of_renter.landlord_id = params[:landlord_id]
    @review_of_renter.rental_id = params[:rental_id]
    @review_of_renter.renter_rating = params[:renter_rating]
    @review_of_renter.renter_notes = params[:renter_notes]
    @review_of_renter.renter_response = params[:renter_response]

    save_status = @review_of_renter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/review_of_renters/#{@review_of_renter.id}/edit", "/update_review_of_renter"
        redirect_to("/review_of_renters/#{@review_of_renter.id}", :notice => "Review of renter updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Review of renter updated successfully.")
      end
    else
      render("review_of_renters/edit.html.erb")
    end
  end

  def destroy
    @review_of_renter = ReviewOfRenter.find(params[:id])

    @review_of_renter.destroy

    if URI(request.referer).path == "/review_of_renters/#{@review_of_renter.id}"
      redirect_to("/", :notice => "Review of renter deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Review of renter deleted.")
    end
  end
end
