Rails.application.routes.draw do
     get 'productcarts/index'
     scope "(:locale)", locale: /en|vi/ do
     root to: 'static_pages#home'
     get 'users/new'
     get '/help', to: 'static_pages#help'
     get '/home', to: 'static_pages#home'

     get '/about', to: 'static_pages#about'
     get '/all', to: 'static_pages#products'
     get '/signup', to: 'users#new'
     get'/login',to: 'sessions#new'
     post '/login', to: 'sessions#create'
     delete '/logout', to: 'sessions#destroy'
     get "/search", to: "search#search"
     resources :productcarts, only: [:index, :create, :update, :destroy]
     resources :carts, only: [:index, :create, :update, :destroy, :show]
     resources :order_items, only: [:create, :update, :destroy]
     resource :cart
     resources :products do
         resources :comments
         resource :ratings
       end
     resources :catelogies, only: :show
     resources :users do
        member do
            end
        end

     resources  :canpaigns
     resources :orders
     namespace :admin do
       resources :base
       resources :products
       resources :canpaigns
       resources :orders
     end
  end
end
