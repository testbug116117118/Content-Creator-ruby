Rails.application.routes.draw do
  devise_for :users
  
  resources :dynamic_templates
  resources :subscribers, only: [:index, :create, :destroy]
  resource :profile, only: [:show, :edit, :update]
  
  # Public landing pages
  get 'p/:username/:template_slug', to: 'public_pages#show', as: :public_template
  
  # API endpoints for template analytics
  namespace :api do
    namespace :v1 do
      resources :template_views, only: [:create]
    end
  end
  
  root to: 'home#index'
end
