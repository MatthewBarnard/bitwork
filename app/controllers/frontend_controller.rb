class FrontendController < ApplicationController
  def index

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
    session[:user_id] = !verified_login ? nil : verified_login
    session[:recent_login] = true


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

  def user_params
    params.require(:user).permit(:full_name,:cellphone,:email,:password,:address)
  end

end
