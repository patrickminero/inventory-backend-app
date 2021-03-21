Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
        post "is_logged_in", to: "sessions#is_logged_in"
      end
      resources :companies, only: [ :index, :show, :update, :create, :destroy ] do
        resources :locations
        resources :products, only: [:index, :show, :update, :create, :destroy ] do
          post 'update_quantity', to: 'products#update_quantity'
        end
        
      end
    end
  end
end
