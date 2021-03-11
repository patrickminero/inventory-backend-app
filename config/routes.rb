Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
      resources :companies, only: [ :index, :show, :update, :create, :destroy ] do
        resources :products, only: [:index, :show, :update, :create, :destroy ]
      end
    end
  end
end
