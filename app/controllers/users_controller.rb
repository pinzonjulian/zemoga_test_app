class UsersController < ApplicationController

  skip_before_action :check_if_user_profile_is_complete, only: [:edit, :update]
  before_action :check_if_current_user, only: [:edit, :update]

  def profile
    redirect_to current_user
  end

  def show
    @user = User.find(params[:id])
    @tweets = $twitter_client.user_timeline(@user.twitter_handle, {count: 5})
  end

  def edit
    @user = current_user
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'User updated!'
      redirect_to user_path(@user)
    else
      raise
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :last_name, :twitter_handle, :description, :avatar)
  end

  def check_if_current_user
    if (current_user.id != params[:id].to_i)
      flash[:alert] = 'You are not authorized to edit this profile'
      redirect_back fallback_location: authenticated_user_root_path
    end
  end

end
