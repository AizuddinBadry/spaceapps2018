Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

scope :api do

	 post "/", to: "api#event", as: "api_event"

end


end
