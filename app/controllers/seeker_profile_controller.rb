class SeekerProfileController < ApplicationController
  layout 'backend_job_seeker'
  def index
    @user = User.find(session[:user_id])
    if @user.user_type != 3
      redirect_to '/'
    else
      @jobs_taken = Advert.where(user_claimed_id: session[:user_id]).count
      @money_received = Advert.where(user_claimed_id: session[:user_id], is_paid: true).sum(:user_claimed_amount)
      @jobs_bid_on = Bid.where(user_id: session[:user_id]).count
    end
  end
end
