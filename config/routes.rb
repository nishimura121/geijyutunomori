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
    resources :items, only: [:index, :show, :destroy, :edit, :update] do
    resource :bookmarks, only: [:create, :destroy]
    end
    resources :users, only: [:index, :show, :edit, :update] do
      resources :bookmarks, only: [:index]
      resource :relationships, only: [:create, :destroy]
        member do
          get 'follows' => 'relationships#follower', as: 'follows'
          get 'followers' => 'relationships#followed', as: 'followers'
        end
      end
    root 'home#index'
  end

scope module: :user do
    resources :users, only: [:show, :new, :update] do
     collection do
       get '/edits' => 'users#edits', as:'edits'
     end
      resources :bookmarks, only: [:index]
      resource :relationships, only: [:create, :destroy]
        member do
          get 'follows' => 'relationships#follower', as: 'follows'
          get 'followers' => 'relationships#followed', as: 'followers'
        end
      collection do
        patch'/cancels' => 'users#destroy', as:'destroy'
        get 'cancels'
      end
    end
    resources :items, only: [:index, :show, :edit, :update, :destroy ,:create ,:new] do
      collection do
       get 'ranking' => 'items#ranking', as: 'ranking'
      end
     resource :bookmarks, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
     resource :comments, only: [:create, :destroy]
    end
end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html