Rails.application.routes.draw do
  
  root to: "top#index"
  resources :reports, only: [:index,:new]
end
