Rails.application.routes.draw do
  root 'frontend#index'

  resources :frontend

  controller :frontend do
    # get 'dashboard' => :index
  end
end
