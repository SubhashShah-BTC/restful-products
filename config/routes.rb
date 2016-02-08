Rails.application.routes.draw do

  # JSON POST Request route
  post "/api/v1/products", to: "api/v1/products#create"

  # Backoffice Admin routes
  scope :admin do
    resources :products, only: [:index, :edit, :update]
  end
end
