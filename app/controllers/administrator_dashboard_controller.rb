class AdministratorDashboardController < ApplicationController
  layout 'backend_administrator'
  def index
    @current_files  = Dir["**/*"].length
    @signups = User.where("created_at::date between current_date AND DATE 'tomorrow'").count
    @comments = Bid.where("created_at::date between current_date AND DATE 'tomorrow'").count
    @adverts = Advert.where("created_at::date between current_date AND DATE 'tomorrow'").count

   @notifications = User.order('created_at DESC').limit(10)
  end

end
