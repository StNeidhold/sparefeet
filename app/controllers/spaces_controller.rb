class SpacesController < ApplicationController
  def index
    @q = Space.ransack(params[:q])
    @spaces = @q.result(:distinct => true).includes(:landlord, :rentals, :offerring_photos).page(params[:page]).per(10)

    render("spaces/index.html.erb")
  end

  def show
    @space_photo = SpacePhoto.new
    @rental = Rental.new
    @space = Space.find(params[:id])

    render("spaces/show.html.erb")
  end

  def new
    @space = Space.new

    render("spaces/new.html.erb")
  end

  def create
    @space = Space.new

    @space.landlord_id = params[:landlord_id]
    @space.size = params[:size]
    @space.notes = params[:notes]
    @space.summary = params[:summary]
    @space.allow_boxes = params[:allow_boxes]
    @space.allow_furniture = params[:allow_furniture]
    @space.allow_sporting_goods = params[:allow_sporting_goods]
    @space.street_address = params[:street_address]
    @space.city = params[:city]
    @space.state = params[:state]
    @space.availability_date = params[:availability_date]
    @space.min_term = params[:min_term]
    @space.dimensions = params[:dimensions]

    save_status = @space.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spaces/new", "/create_space"
        redirect_to("/spaces")
      else
        redirect_back(:fallback_location => "/", :notice => "Space created successfully.")
      end
    else
      render("spaces/new.html.erb")
    end
  end

  def edit
    @space = Space.find(params[:id])

    render("spaces/edit.html.erb")
  end

  def update
    @space = Space.find(params[:id])

    @space.landlord_id = params[:landlord_id]
    @space.size = params[:size]
    @space.notes = params[:notes]
    @space.summary = params[:summary]
    @space.allow_boxes = params[:allow_boxes]
    @space.allow_furniture = params[:allow_furniture]
    @space.allow_sporting_goods = params[:allow_sporting_goods]
    @space.street_address = params[:street_address]
    @space.city = params[:city]
    @space.state = params[:state]
    @space.availability_date = params[:availability_date]
    @space.min_term = params[:min_term]
    @space.dimensions = params[:dimensions]

    save_status = @space.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/spaces/#{@space.id}/edit", "/update_space"
        redirect_to("/spaces/#{@space.id}", :notice => "Space updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Space updated successfully.")
      end
    else
      render("spaces/edit.html.erb")
    end
  end

  def destroy
    @space = Space.find(params[:id])

    @space.destroy

    if URI(request.referer).path == "/spaces/#{@space.id}"
      redirect_to("/", :notice => "Space deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Space deleted.")
    end
  end
end
