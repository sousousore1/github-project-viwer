Rails.application.routes.draw do
  resources :repositories do
    resources :issues, only: [:show]
    resources :projects, only: [:index, :show]
  end
  root 'projects#index'
end
