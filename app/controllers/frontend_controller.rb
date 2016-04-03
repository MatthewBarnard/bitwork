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

  end

  def save_register_job_provider
    user = User.new(user_params)
    user.user_type = 2
    if (user.valid?)
      user.save
    end

    verified_login = User.login(user.email, user.password)
    session[:user_id] = !verified_login ? nil : verified_login

    redirect_to action: 'index'
  end

  def save_register_job_seeker

  end
  def user_params
    params.require(:user).permit(:full_name,:cellphone,:email,:password,:address)
  end
end
