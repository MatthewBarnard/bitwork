class AdministratorDashboardController < ApplicationController
  layout 'backend_administrator'
  before_action :check_admin

  def index
    @current_files  = Dir["**/*"].length
    @signups = User.where("created_at::date between current_date AND DATE 'tomorrow'").count
    @comments = Bid.where("created_at::date between current_date AND DATE 'tomorrow'").count
    @adverts = Advert.where("created_at::date between current_date AND DATE 'tomorrow'").count

   @notifications = User.order('created_at DESC').limit(10)
  end

  def check_admin
    if session[:is_admin].blank?
      redirect_to '/'
    end
  end

end
