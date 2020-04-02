Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  root to: "top#index"
  resources :groups do
    resources :reports do
      collection do
        get 'top'
        get 'search'
      end
    end
  end
  resources :attendances, only: [:index,:edit,:update]
  resources :weather, only: :index
end