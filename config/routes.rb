Rails.application.routes.draw do
  root to: "top#index"
  get 'attendances/index'
  get 'attendances/edit'
  resources :groups, only: [:index,:new,:create,:edit]
  devise_for :users
  resources :reports do
    collection do
      get 'top'
    end
  end
  resources :attendances, only: [:index,:edit,:update]
end