Rails.application.routes.draw do
  resources :lists, only: [:index, :create, :destroy]
  root "lists#index"
end
