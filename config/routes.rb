Rails.application.routes.draw do
  root to: "top#index"
  # devise_for :installs
  get 'attendances/index'
  get 'attendances/edit'
  resources :groups, only: [:index,:new,:create]
  resources :reports do
    collection do
      get 'top'
    end
  end
  devise_for :users
end








# root to: "top#index"
# devise_for :users
# # devise_for :installs
# get 'attendances/index'
# get 'attendances/edit'
# resources :groups, only: [:new,:create]
# resources :reports do
#   collection do
#     get 'top'
#   end
# end