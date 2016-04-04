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
    current_advert = Advert.new(advert_params)
    current_advert.user_id = session[:user_id]
    current_advert.is_active = true

    if current_advert.valid?
      current_advert.save
    end

    redirect_to '/provider/adverts'
  end

  def advert_params
    params.require(:advert).permit(:id,:date_required,:date_expiry,:title,:payment,:description,:location)
  end
end
