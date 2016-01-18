Rails.application.routes.draw do
  root 'frontend#index'

  resources :frontend
  resources :administrator_dashboard
  resources :administrator_users
  resources :administrator_adverts
  resources :administrator_affiliate_marketing

  controller :frontend do
    # REGISTER
    get '/register/seeker' => :register_job_seeker
    get '/register/provider' => :register_job_provider
    post '/register/seeker' => :save_register_job_seeker
    patch '/register/seeker' => :save_register_job_seeker
    post '/register/provider' => :save_register_job_provider
    patch '/register/provider' => :save_register_job_provider

  end

  controller :administrator_dashboard do
    get '/administrator/dashboard' => :index
  end

  controller :administrator_users do
    get '/administrator/users' => :index
  end

  controller :administrator_adverts do
    get '/administrator/adverts' => :index
  end
  controller :administrator_affiliate_marketing do
    get '/administrator/affiliate_marketing' => :index
  end


end
