Rails.application.routes.draw do
  root to: "top#index"
  get 'attendances/index'
  get 'attendances/edit'
  resources :groups, only: [:index,:new,:create]
  root to: "top#index"
  devise_for :users
  resources :reports do
    collection do
      get 'top'
    end
  end
  devise_for :users
  resources :attendances, only: [:index,:edit,:update]
end