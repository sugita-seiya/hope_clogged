Rails.application.routes.draw do
  root to: "top#index"
  get 'attendances/index'
  get 'attendances/edit'
  devise_for :users
  resources :groups do
    resources :reports do
      collection do
        get 'top'
      end
    end
  end
  resources :attendances, only: [:index,:edit,:update]
end