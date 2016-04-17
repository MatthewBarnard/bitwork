class AdministratorAdvertsController < ApplicationController
  layout 'backend_administrator'

  def index
    @advert = Advert.all
  end

  def activate
    current_advert = Advert.find(params[:id])
    current_advert.is_active = true
    current_advert.save

    redirect_to :back
  end

  def disable
    current_advert = Advert.find(params[:id])
    current_advert.is_active = false
    current_advert.save

    redirect_to :back
  end
end
