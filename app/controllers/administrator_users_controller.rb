class AdministratorUsersController < ApplicationController
  layout 'backend_administrator'
  before_action :check_admin

  def index
    @users = User.all
  end

  def activate
    current_user = User.find(params[:id])
    current_user.is_active = true
    current_user.save

    redirect_to :back
  end

  def disable
    current_user = User.find(params[:id])
    current_user.is_active = false
    current_user.save

    redirect_to :back
  end

  def check_admin
    if session[:is_admin].blank?
      redirect_to '/'
    end
  end
end
