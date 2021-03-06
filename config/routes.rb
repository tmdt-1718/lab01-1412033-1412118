Rails.application.routes.draw do
root 'sessions#new'
	resources :users, only: [:new, :create]

	get '/sessions/login', to: 'sessions#new', as: :login
  post '/sessions/login', to: 'sessions#create', as: nil
  delete '/sessions/logout', to: 'sessions#destroy', as: :logout


  resources :articles, only: [:index, :show, :edit, :update, :destroy] do
  	resources :comments, only: [:index]
  end
	resources :blog, only: [:index, :show, :edit, :update, :destroy] do
		resources :comments, only: [:index]
	end
  resources :photos, only: [:index, :show, :edit, :update, :destroy] do
		resources :comments, only: [:index]
	end
	resources :about, only: [:index]
end
