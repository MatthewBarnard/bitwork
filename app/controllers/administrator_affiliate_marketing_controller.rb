class AdministratorAffiliateMarketingController < ApplicationController
  layout 'backend_administrator'
  before_action :check_admin

  def index

  end

  def check_admin
    if session[:is_admin].blank?
      redirect_to '/'
    end
  end
end
