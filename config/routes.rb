Rails.application.routes.draw do
  
  scope module: :public do
    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/confirm' => 'orders#confilm'
    get '/orders/complete' => 'orders#complete'
  end
  
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  end
  
  scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end
  
  scope module: :public do
    resources :items, only: [:index, :show]
  end
  
  scope module: :public do
    resource :customers, only: [:edit, :update]
    get 'customers/my/page' => 'customers#show'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw' => 'customers#withdraw'
  end
  
  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
   passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
   sessions:      'customers/sessions',
   passwords:     'customers/passwords',
   registrations: 'customers/registrations'
  }
  namespace :admin do
    resources :items
    # get 'items/index'
    # get 'items/new'
    # get 'items/create'
    # get 'items/show'
    # get 'items/edit'
    # get 'items/update'
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  
  root 'public/homes#top'
  get 'about' => 'public/homes#about'
  # resources :items, only: [:new, :create, :index, :show, :eedit, :update]
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  
end
