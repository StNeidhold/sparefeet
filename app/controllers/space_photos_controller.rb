class SpacePhotosController < ApplicationController
  def index
    @space_photos = SpacePhoto.page(params[:page]).per(10)

    render("space_photos/index.html.erb")
  end

  def show
    @space_photo = SpacePhoto.find(params[:id])

    render("space_photos/show.html.erb")
  end

  def new
    @space_photo = SpacePhoto.new

    render("space_photos/new.html.erb")
  end

  def create
    @space_photo = SpacePhoto.new

    @space_photo.landlord_id = params[:landlord_id]
    @space_photo.space_id = params[:space_id]
    @space_photo.photo = params[:photo]

    save_status = @space_photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/space_photos/new", "/create_space_photo"
        redirect_to("/space_photos")
      else
        redirect_back(:fallback_location => "/", :notice => "Space photo created successfully.")
      end
    else
      render("space_photos/new.html.erb")
    end
  end

  def edit
    @space_photo = SpacePhoto.find(params[:id])

    render("space_photos/edit.html.erb")
  end

  def update
    @space_photo = SpacePhoto.find(params[:id])

    @space_photo.landlord_id = params[:landlord_id]
    @space_photo.space_id = params[:space_id]
    @space_photo.photo = params[:photo]

    save_status = @space_photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/space_photos/#{@space_photo.id}/edit", "/update_space_photo"
        redirect_to("/space_photos/#{@space_photo.id}", :notice => "Space photo updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Space photo updated successfully.")
      end
    else
      render("space_photos/edit.html.erb")
    end
  end

  def destroy
    @space_photo = SpacePhoto.find(params[:id])

    @space_photo.destroy

    if URI(request.referer).path == "/space_photos/#{@space_photo.id}"
      redirect_to("/", :notice => "Space photo deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Space photo deleted.")
    end
  end
end
