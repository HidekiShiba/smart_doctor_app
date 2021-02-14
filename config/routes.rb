Rails.application.routes.draw do
  devise_for :patients, controllers: {
    registrations: 'patients/registrations',
    sessions:      'patients/sessions',
    passwords:     'patients/passwords'
  }
  
  devise_for :admin, controllers: {
    sessions:      'admins/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'search' => 'searches#search'
    resources :patients, only: [:show, :edit, :update] do
      member do
        patch 'withdraw'
      end
    end
    resources :congestions, only: [:index]
    resources :reservations, only: [:index, :create, :show, :edit, :update, :destroy] do
      collection do
        post 'confirm'
      end
    end
    resources :examinations, only: [:index, :show]
    resources :receptions, only: [:index, :new, :create, :destroy]
    resources :informations, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
  end

  namespace :admin do
    root to: 'congestions#index'
    get 'search' => 'searches#search'
    resources :patients, only: [:index, :show, :edit, :update]
    resources :reservations, only: [:index, :show, :edit, :update, :destroy]
    resources :examinations, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :congestions, only: [:index, :new, :create, :edit, :update]
    resources :receptions, only: [:index, :show, :update, :destroy]
    resources :themes, only: [:index, :create, :edit, :update]
    resources :informations, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
end
