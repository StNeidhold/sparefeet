Rails.application.routes.draw do
  # Routes for the Space resource:
  # CREATE
  get "/spaces/new", :controller => "spaces", :action => "new"
  post "/create_space", :controller => "spaces", :action => "create"

  # READ
  get "/spaces", :controller => "spaces", :action => "index"
  get "/spaces/:id", :controller => "spaces", :action => "show"

  # UPDATE
  get "/spaces/:id/edit", :controller => "spaces", :action => "edit"
  post "/update_space/:id", :controller => "spaces", :action => "update"

  # DELETE
  get "/delete_space/:id", :controller => "spaces", :action => "destroy"
  #------------------------------

  # Routes for the Rental resource:
  # CREATE
  get "/rentals/new", :controller => "rentals", :action => "new"
  post "/create_rental", :controller => "rentals", :action => "create"

  # READ
  get "/rentals", :controller => "rentals", :action => "index"
  get "/rentals/:id", :controller => "rentals", :action => "show"

  # UPDATE
  get "/rentals/:id/edit", :controller => "rentals", :action => "edit"
  post "/update_rental/:id", :controller => "rentals", :action => "update"

  # DELETE
  get "/delete_rental/:id", :controller => "rentals", :action => "destroy"
  #------------------------------

  devise_for :stewards
  # Routes for the Steward resource:
  # READ
  get "/stewards", :controller => "stewards", :action => "index"
  get "/stewards/:id", :controller => "stewards", :action => "show"


  devise_for :renters
  # Routes for the Renter resource:
  # READ
  get "/renters", :controller => "renters", :action => "index"
  get "/renters/:id", :controller => "renters", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
