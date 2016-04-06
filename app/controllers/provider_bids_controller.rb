class ProviderBidsController < ApplicationController
  layout 'backend_job_provider'
  def index
    @user = User.find(session[:user_id])
  end
end
