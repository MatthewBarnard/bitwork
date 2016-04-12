class SeekerPaymentsController < ApplicationController
  layout 'backend_job_seeker'
  def index
    @user = User.find(session[:user_id])
    if @user.user_type != 3
      redirect_to '/'
    else
      @jobs = Advert.where(user_claimed_id: session[:user_id])
    end
  end
  def mark_as_paid
    current_advert = Advert.find(params[:id])
    current_advert.is_paid = true
    current_advert.save

    redirect_to :back
  end
end
