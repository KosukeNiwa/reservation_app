class UsersController < ApplicationController
  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(params.require(:user).permit(:icon_img, :user_name, :user_introduction))
      flash[:notice] = "Profile was successfully updated."
      redirect_to users_profile_path
    else
      render "profile"
    end
  end
end
