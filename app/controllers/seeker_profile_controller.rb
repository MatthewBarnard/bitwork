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

      @notifications = Advert.where("user_claimed_id = #{@user.id} AND is_claimed = true AND (has_rated IS NULL OR has_rated = false)")
    end
  end

  def save_rating
    current_advert = Advert.find(params[:rating][:advert_id])
    current_advert.has_rated = true
    current_advert.save

    current_rating = Rating.new
    current_rating.rating_from = params[:rating][:user_from]
    current_rating.rating_to = params[:rating][:user_to]
    rating = !params[:rating][:star1].blank? ? 1 : !params[:rating][:star2].blank? ? 2 : !params[:rating][:star3].blank? ? 3 :  !params[:rating][:star4].blank? ? 4 : !params[:rating][:star5].blank? ? 5 : 5
    current_rating.rating = rating
    current_rating.comment = params[:rating][:comment]
    current_rating.save

    redirect_to :back
  end
end
