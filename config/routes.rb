Rails.application.routes.draw do
	root "sessions#new"

	resources :sessions, only: [:new, :create, :destroy]
	delete '/signout', to: "sessions#destroy", as: "signout"

	resources :users
	resources :statuses
	resources :welcome, only: [:index]
	resources :likes
end
