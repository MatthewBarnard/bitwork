class AdministratorCommentsController < ApplicationController
  layout 'backend_administrator'

  def index
    @bids = Bid.all
  end

  def activate
    current_comment = Bid.find(params[:id])
    current_comment.is_active = true
    current_comment.save

    redirect_to :back
  end

  def disable
    current_comment = Bid.find(params[:id])
    current_comment.is_active = false
    current_comment.save

    redirect_to :back
  end
end
