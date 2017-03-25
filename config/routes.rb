Rails.application.routes.draw do
  namespace :api do 
  	namespace :v1 do 
	  	resources :airports, only: [:index]
	  end
	end
end
