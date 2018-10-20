Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

scope :api do

	 post "/", to: "api#event", as: "api_event"
	
end

scope :home do

	 get "/index2", to: "home#index2", as: "home_index2"

end


end
