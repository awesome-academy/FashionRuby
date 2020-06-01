Rails.application.routes.draw do
		  get 'users/new'
		root 'static_pages#home'
		get '/help', to: 'static_pages#help'
		get '/home', to: 'static_pages#home'
		get '/contact', to: 'static_pages#contact'
		get '/all', to: 'static_pages#products'
		get '/signup', to: 'users#new'
		get '/login', to: 'sessions#new'
		resources :products
end