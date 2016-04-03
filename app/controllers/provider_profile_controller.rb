class ProviderProfileController < ApplicationController
  layout 'backend_job_provider'
  skip_before_filter :verify_authenticity_token, :only => :index

  def index

    @user = User.find(session[:user_id])
    # if !session[:rerender_layout].blank?
    #   session[:rerender_layout] = nil
    #
    #   # respond_to do |format|
    #   #   format.js { render :js => "my_function();" }
    #   # end
    #   render :js => "location.reload();"
    #
    # end
  end
end
