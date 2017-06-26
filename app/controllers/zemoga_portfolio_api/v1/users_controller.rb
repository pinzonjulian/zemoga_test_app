class ZemogaPortfolioApi::V1::UsersController < ApplicationController

  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:modify_user_info]
  before_action :authenticate, except: [:user_info]

  def user_info
    @user = User.find(params[:id])
  end

  def modify_user_info
    @user = User.find(params[:id])
    byebug
    if @user.blank?
      head :no_content
    elsif @user.update(user_info_params)
      head :ok
    else
      head :method_not_allowed
    end

  end

  private
  def user_info_params
    params.require(:user).permit(:id, :name, :last_name, :description, :twitter_handle, :avatar)
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      # Compare the tokens in a time-constant manner, to mitigate
      # timing attacks.

      user_token = User.find(params[:id]).api_key.token
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(token),
        ::Digest::SHA256.hexdigest(user_token)
      )
    end
  end
end



# curl http://localhost:3000/zemoga_portfolio_api/modify_user_info/1 -X PATCH -H 'Authorization: Token token="NFDxd2hWtk3s35eZhAsx19Sa"' -d "{\"user\": {\"name\": \"juli\",\"last_name\": \"pin\"}}" -H "Accept: application/json" -H "Content-type: application/json"
