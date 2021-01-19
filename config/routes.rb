Rails.application.routes.draw do
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
