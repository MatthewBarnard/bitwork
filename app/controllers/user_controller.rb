class UserController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def update_user
    @user = User.find(session[:user_id])

    @user.full_name = user_params[:full_name]
    @user.cellphone = user_params[:cellphone]
    @user.email = user_params[:email]
    @user.password = user_params[:password]

    # UPLOAD PROFILE PICTURE
    if !user_params[:file].blank?
      saved_as = Time.now.to_i.to_s + File.extname(user_params[:file].original_filename)
      directory = "public/images/profile_pictures"
      path = File.join(directory, saved_as)
      File.open(path, "wb") { |f| f.write(user_params[:file].read) }

      @user.profile_picture = saved_as
    end
    # / UPLOAD PROFILE PICTURE

    @user.save
    redirect_to :back
  end

  def user_params
    params.require(:user).permit(:full_name, :cellphone, :email, :password,:file)
  end
end
