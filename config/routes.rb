Rails.application.routes.draw do
		  get 'users/new'
		root 'static_pages#home'
		get '/help', to: 'static_pages#help'
		get '/home', to: 'static_pages#home'
		get '/contact', to: 'static_pages#contact'
		get '/signup', to: 'users#new'
		get '/login', to: 'sessions#new'
		get '/women', to: 'products#women'
		get '/man', to: 'products#men'
		resources :products
end