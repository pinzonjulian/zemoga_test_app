class ZemogaPortfolioApi::V1::UsersController < ApplicationController

  def user_info
    @user = User.find(params[:id])
    # respond_to do |format|
    #   format.json { render json: @user }
    # end
  end
end
