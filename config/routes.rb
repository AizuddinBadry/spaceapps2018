Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"


scope :home do

	 get "/index2", to: "home#index2", as: "home_index2"
	 get "/index3", to: "home#index3", as: "home_index3"
end
  scope :api do
    get "/events/:id", to: "api#event", as: "api_event"
    post '/crisis', to: 'api#crisis', as: 'api_crisis'
  end
end
