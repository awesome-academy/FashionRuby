Rails.application.routes.draw do
    # get 'order_items/create'
    # get 'order_items/update'
    # get 'order_items/destroy'
    # get 'carts/show'
    # get 'carts/destroy'
    #  get 'carts/edit'

        get 'productcarts/index'
		get 'users/new'
		root 'static_pages#home'
		get '/help', to: 'static_pages#help'
		get '/home', to: 'static_pages#home'
		get '/contact', to: 'static_pages#contact'
		get '/all', to: 'static_pages#products'
		get '/signup', to: 'users#new'
		get '/login', to: 'sessions#new'
        get "/search", to: "search#search"
		resources :products, only: [:index, :create, :update, :destroy, :show]
        resources :productcarts, only: [:index, :create, :update, :destroy]
        resources :carts, only: [:index, :create, :update, :destroy, :show]
        resources :order_items, only: [:create, :update, :destroy]
        resource :cart




    # get '/cart', to: 'sessions#cart'
    # get '/details', to: 'detail#show'
end
