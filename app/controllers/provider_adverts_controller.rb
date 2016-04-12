class ProviderAdvertsController < ApplicationController
  layout 'backend_job_provider'

  def index
    @user = User.find(session[:user_id])
    @adverts = Advert.where(user_id: session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
    if params[:id].blank?
      @advert = Advert.new
    else
      @advert = Advert.find(params[:id])
    end
  end

  def save
    if advert_params[:id].blank?
      current_advert = Advert.new(advert_params)
      current_advert.user_id = session[:user_id]
      current_advert.is_active = true

      if current_advert.valid?
        current_advert.save

        current_user = User.find(session[:user_id])
        current_user.jobs = Advert.where(is_active: true, user_id: session[:user_id]).count
        current_user.save

        current_user.seeker_update_rating
      end
    else
      current_advert = Advert.find(advert_params[:id])
      current_advert.update(advert_params)
    end

    redirect_to '/provider/adverts'
  end

  def view
    #TODO: put advert in partial with id and display here
    render nothing: true
  end

  def enable
    advert = Advert.find(params[:id])
    advert.is_active = true
    advert.save

    redirect_to '/provider/adverts'
  end

  def disable
    advert = Advert.find(params[:id])
    advert.is_active = false
    advert.save

    redirect_to '/provider/adverts'
  end

  def advert_params
    params.require(:advert).permit(:id,:date_required,:date_expiry,:title,:payment,:description,:location)
  end
end
