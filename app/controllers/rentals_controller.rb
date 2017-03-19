class RentalsController < ApplicationController
  def index
    @rentals = Rental.all

    render("rentals/index.html.erb")
  end

  def show
    @rental = Rental.find(params[:id])

    render("rentals/show.html.erb")
  end

  def new
    @rental = Rental.new

    render("rentals/new.html.erb")
  end

  def create
    @rental = Rental.new

    @rental.renter_id = params[:renter_id]
    @rental.landlord_id = params[:landlord_id]
    @rental.monthly_rate = params[:monthly_rate]
    @rental.space_id = params[:space_id]

    save_status = @rental.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rentals/new", "/create_rental"
        redirect_to("/rentals")
      else
        redirect_back(:fallback_location => "/", :notice => "Rental created successfully.")
      end
    else
      render("rentals/new.html.erb")
    end
  end

  def edit
    @rental = Rental.find(params[:id])

    render("rentals/edit.html.erb")
  end

  def update
    @rental = Rental.find(params[:id])

    @rental.renter_id = params[:renter_id]
    @rental.landlord_id = params[:landlord_id]
    @rental.monthly_rate = params[:monthly_rate]
    @rental.space_id = params[:space_id]

    save_status = @rental.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/rentals/#{@rental.id}/edit", "/update_rental"
        redirect_to("/rentals/#{@rental.id}", :notice => "Rental updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Rental updated successfully.")
      end
    else
      render("rentals/edit.html.erb")
    end
  end

  def destroy
    @rental = Rental.find(params[:id])

    @rental.destroy

    if URI(request.referer).path == "/rentals/#{@rental.id}"
      redirect_to("/", :notice => "Rental deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Rental deleted.")
    end
  end
end
