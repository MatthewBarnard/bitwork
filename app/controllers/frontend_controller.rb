class FrontendController < ApplicationController
  def index
    @adverts = Advert.get_active.order('created_at ASC').limit(6)
    @users = User.all.order('rating ASC').limit(3)
  end

  # ------------------------------------------------------------ #
  # --------------------------REGISTER-------------------------- #
  # ------------------------------------------------------------ #

  def register_job_provider
    @user = User.new
  end

  def register_job_seeker
    @user = User.new
  end

  def save_register_job_provider
    user = User.new(user_params)
    user.user_type = 2
    if (user.valid?)
      user.save
    end

    verified_login = User.login(user.email, user.password)
    if !verified_login
      session[:user_id] = nil
      session[:recent_login] = nil
      session[:account_link] = nil
    else
      session[:user_id] = verified_login
      session[:recent_login] = true
      if User.find(verified_login).user_type == 2
        session[:account_link] = 'provider/profile'
      else
        session[:account_link] = 'seeker/profile'
      end
    end

    redirect_to action: 'index'
  end

  def save_register_job_seeker
    user = User.new(user_params)
    user.user_type = 3
    if (user.valid?)
      user.save
    end

    verified_login = User.login(user.email, user.password)
    if !verified_login
      session[:user_id] = nil
      session[:recent_login] = nil
      session[:account_link] = nil
    else
      session[:user_id] = verified_login
      session[:recent_login] = true
      if User.find(verified_login).user_type == 2
        session[:account_link] = 'provider/profile'
      else
        session[:account_link] = 'seeker/profile'
      end
    end

    redirect_to action: 'index'
  end

  def about_us

  end

  # ADVERTS
  def browse
    @adverts = Advert.get_active
  end

  def advert
    @advert = Advert.find(params[:id])
    @bid = Bid.new
    @winning_bid = @advert.bids.where(is_lead: true).first rescue nil
  end

  def save_bid
    current_bid = Bid.new
    current_bid.user_id = session[:user_id]
    current_bid.advert_id = params[:id]
    current_bid.amount = params[:bid][:amount]
    current_bid.comment = params[:bid][:comment]
    current_bid.is_lead = current_bid.set_lead
    current_bid.save

    redirect_to :back
  end

  # SEARCH

  def search
    @adverts = Advert.get_active
    @search_results = Advert.where("lower(title) LIKE '%#{params[:search].downcase}%' AND date_expiry >= current_date AND (is_active = true OR is_active IS NULL) AND (is_claimed = false OR is_claimed IS NULL)")
  end

  # GENERAL

  def login
    verified_login = User.login(params[:login][:email], params[:login][:password])
    if !verified_login
      session[:user_id] = nil
      session[:recent_login] = nil
      session[:account_link] = nil
    else
      session[:user_id] = verified_login
      session[:recent_login] = true


      if User.find(verified_login).user_type == 2
        session[:account_link] = 'provider/profile'
      else
        session[:account_link] = 'seeker/profile'
      end
    end

    redirect_to action: 'index'
  end

  def logout
    session[:user_id] = nil
    redirect_to action: 'index'
  end

  # PARAMS

  def user_params
    params.require(:user).permit(:full_name, :cellphone, :email, :password, :address)
  end

end
