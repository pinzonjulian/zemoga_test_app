class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :check_if_user_profile_is_complete

  def after_sign_in_path_for(resource)
    byebug
    if resource.is_a?(User)
      authenticated_user_root_path
    elsif resource.is_a?(Admin)
      rails_admin_path
    else
      root_path
    end
  end


  private
  def check_if_user_profile_is_complete
    if current_user && !current_user.profile_info_is_complete?
      flash[:notice] = 'Completa tu perfil'
      redirect_to edit_user_path(current_user)
    end
  end
end
