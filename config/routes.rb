Rails.application.routes.draw do
  root to: "top#index"
  devise_for :users
  # devise_for :installs
  get 'attendances/index'
  get 'attendances/edit'
  resources :reports do
    collection do
      get 'top'
    end
  end
  resources :groups, only: [:new,:create]
end
