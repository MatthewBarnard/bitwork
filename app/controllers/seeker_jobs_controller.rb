class SeekerJobsController < ApplicationController
  layout 'backend_job_seeker'
  def index
    @user = User.find(session[:user_id])
    if @user.user_type != 3
      redirect_to '/'
    else
      @jobs = Advert.where(user_claimed_id: session[:user_id])
    end
  end
end
