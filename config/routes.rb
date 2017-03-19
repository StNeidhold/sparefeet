Rails.application.routes.draw do
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
