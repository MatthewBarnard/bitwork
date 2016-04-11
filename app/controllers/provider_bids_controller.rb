class ProviderBidsController < ApplicationController
  layout 'backend_job_provider'
  def index
    @user = User.find(session[:user_id])
    @adverts = Advert.where(user_id: session[:user_id])
  end

  def accept_bid
    current_bid = Bid.find(params[:id])
    current_bid.is_accepted = true
    current_bid.save

    current_bid.advert.is_claimed = true
    current_bid.advert.user_claimed_id = current_bid.user_id
    current_bid.advert.user_claimed_amount = current_bid.amount
    current_bid.advert.save

    redirect_to :back
  end
end
