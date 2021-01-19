Rails.application.routes.draw do
  namespace :admin do
    get 'patients/index'
    get 'patients/show'
    get 'patients/edit'
  end
  namespace :admin do
    get 'informations/index'
    get 'informations/new'
    get 'informations/show'
    get 'informations/edit'
  end
  namespace :admin do
    get 'themes/index'
    get 'themes/edit'
  end
  namespace :admin do
    get 'receptions/index'
    get 'receptions/show'
  end
  namespace :admin do
    get 'congestions/index'
  end
  namespace :admin do
    get 'examinations/index'
    get 'examinations/new'
    get 'examinations/show'
    get 'examinations/edit'
  end
  namespace :admin do
    get 'reservations/index'
    get 'reservations/show'
    get 'reservations/edit'
  end
  namespace :public do
    get 'informations/index'
    get 'informations/show'
  end
  namespace :public do
    get 'receptions/index'
    get 'receptions/new'
  end
  namespace :public do
    get 'examinations/index'
    get 'examinations/show'
  end
  namespace :public do
    get 'reservations/index'
    get 'reservations/show'
    get 'reservations/new'
    get 'reservations/edit'
  end
  namespace :public do
    get 'patients/show'
    get 'patients/edit'
    get 'patients/unsubscribe'
  end
  devise_for :patients, controllers: {
    registrations: 'patients/registrations',
    #passwords:     'patients/passwords',
    sessions: 'patients/sessions'
  }
  devise_for :admin, controllers: {
    sessions: 'admins/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
