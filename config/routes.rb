Rails.application.routes.draw do

  root 'user/home#index'
  get '/about' => 'user/home#show'

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

  namespace :admin do
  	resources :comments, only: [:destroy]
    resources :items, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    root 'home#index'
  end

scope module: :user do
    resources :users, only: [:show, :new] do
      resource :relationships, only: [:create, :destroy]
        member do
          get 'follows' => 'relationships#follower', as: 'follows'
          get 'followers' => 'relationships#followed', as: 'followers'
        end
      collection do
        delete'/' => 'users#destroy', as:'destroy'
        post 'cancel'
      end
    end
    resources :items, only: [:index, :show, :edit, :update, :destroy ,:create ,:new] do
     resource :comments, only: [:create, :destroy]
    end
end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html