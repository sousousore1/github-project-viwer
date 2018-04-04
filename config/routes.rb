Rails.application.routes.draw do
  resources :repositories, only: [:index] do
    resources :projects, only: [:index, :show]
  end
  root 'projects#index'
end
