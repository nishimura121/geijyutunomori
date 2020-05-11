Rails.application.routes.draw do

  root 'user/home#index'
  get '/about' => 'user/home#show'

  namespace :admin do
  	resources :comments, only: [:show, :destroy]
    resources :items, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    root 'home#index'
  end

  scope module: :user do
  	resource :users , only: [:show, :new] do
      member do
        patch'/' => 'users#destroy', as:'destroy'
        get 'cancel'
      end
    resources :items, only: [:index, :show, :edit, :update, :destroy ,:create ,:new] do
      resources :comments, only: [:create, :new]
     end
    end
  end

	devise_for :admins, controllers: {
	  sessions:      'admin/admins/sessions',
	  passwords:     'admin/admins/passwords',
	  registrations: 'admin/admins/registrations'
	}
	devise_for :users, controllers: {
	  sessions:      'user/users/sessions',
	  passwords:     'user/users/passwords',
	  registrations: 'user/users/registrations'
	}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
