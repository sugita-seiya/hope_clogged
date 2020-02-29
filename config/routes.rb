Rails.application.routes.draw do
  devise_for :installs
  get 'attendances/index'
  root to: "top#index"
  devise_for :users
  resources :reports do
    collection do
      get 'top'
    end
  end
  resources :groups, only: [:new,:create]
end
