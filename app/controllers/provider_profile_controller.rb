class ProviderProfileController < ApplicationController
  layout 'backend_job_provider'
  skip_before_filter :verify_authenticity_token, :only => :index

  def index

    @user = User.find(session[:user_id])
    if @user.user_type != 2
      redirect_to '/'
    else
    end
  end
end
