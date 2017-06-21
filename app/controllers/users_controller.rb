class UsersController < ApplicationController

  skip_before_action :check_if_user_profile_is_complete, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @tweets = $twitter_client.user_timeline(@user.twitter_handle, {count: 5})
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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

end
