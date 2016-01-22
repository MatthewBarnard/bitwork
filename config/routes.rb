Rails.application.routes.draw do
  root 'frontend#index'

  resources :frontend

  resources :administrator_dashboard
  resources :administrator_users
  resources :administrator_adverts
  resources :administrator_affiliate_marketing
  resources :administrator_comments

  resources :provider_profile
  resources :provider_adverts
  resources :provider_bids
  resources :provider_payments

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

  controller :administrator_comments do
    get '/administrator/comments' => :index
  end

  # JOB PROVIDER BACKEND

  controller :provider_profile do
    get '/provider/profile' => :index
  end

  controller :provider_adverts do
    get '/provider/adverts' => :index
  end

  controller :provider_bids do
    get '/provider/bids' => :index
  end

  controller :provider_payments do
    get '/provider/payments' => :index
  end

end
