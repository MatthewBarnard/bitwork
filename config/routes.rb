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

  resources :seeker_profile
  resources :seeker_jobs
  resources :seeker_payments

  # ADMINISTRATOR BACKEND

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
    get '/provider/adverts/new' => :new
    get '/provider/adverts/:id/edit' => :new
    get '/provider/adverts/:id/view' => :view
    get '/provider/adverts/:id/disable' => :disable
    get '/provider/adverts/:id/enable' => :enable

    post '/provider/adverts/new' => :save
    patch '/provider/adverts/new' => :save
  end

  controller :provider_bids do
    get '/provider/bids' => :index
  end

  controller :provider_payments do
    get '/provider/payments' => :index
  end

  # JOB SEEKER BACKEND

  controller :seeker_profile do
    get '/seeker/profile' => :index
  end

  controller :seeker_jobs do
    get '/seeker/jobs' => :index
  end

  controller :seeker_payments do
    get '/seeker/payments' => :index
  end

  controller :frontend do
    # REGISTER
    get '/register/seeker' => :register_job_seeker
    get '/register/provider' => :register_job_provider
    post '/register/seeker' => :save_register_job_seeker
    patch '/register/seeker' => :save_register_job_seeker
    post '/register/provider' => :save_register_job_provider
    patch '/register/provider' => :save_register_job_provider

    # GENERAL
    post '/login' => :login
    patch '/login' => :login
    get '/logout' => :logout

    get '/about_us' => :about_us

    # ADVERTS
    get '/browse' => :browse
    get '/search/:search' => :search
    get '/advert/:id' => :advert
    post '/advert/:id' => :save_bid
    patch '/advert/:id' => :save_bid
  end
end
