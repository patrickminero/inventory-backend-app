Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :companies, only: [ :index, :show, :update, :create, :destroy ] do
        resources :products, only: [:index, :show, :update ]
      end
    end
  end
end
