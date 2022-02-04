Rails.application.routes.draw do
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
  root 'customer/homes#top'
  get 'about' => 'customer/homes#about'
  # resources :items, only: [:new, :create, :index, :show, :eedit, :update]
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
