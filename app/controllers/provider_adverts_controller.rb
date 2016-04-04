class ProviderAdvertsController < ApplicationController
  layout 'backend_job_provider'

  def index
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
    @advert = Advert.new
  end

  def save
    render nothing: true
  end
end
