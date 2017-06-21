class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :check_if_user_profile_is_complete
  protect_from_forgery with: :exception


  private
  def check_if_user_profile_is_complete
    if !current_user.profile_info_is_complete?
      flash[:notice] = 'Completa tu perfil'
      redirect_to edit_user_path(current_user)
    end
  end
end
