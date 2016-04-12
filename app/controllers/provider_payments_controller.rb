class ProviderPaymentsController < ApplicationController
  layout 'backend_job_provider'

  def index
    @user = User.find(session[:user_id])
    if @user.user_type != 2
      redirect_to '/'
    else
      @immediately_due = Advert.total_due(session[:user_id])
      @overdue = 0
      @saving = Advert.total_saved(session[:user_id])

      @adverts = Advert.where(user_id: session[:user_id], is_claimed: true)
    end
  end
end
