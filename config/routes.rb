Rails.application.routes.draw do
  
  get 'attendances/index'
  root to: "top#index"
  resources :reports, only: [:index,:new]
end
