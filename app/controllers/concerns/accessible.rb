module Accessible
  extend ActiveSupport::Concern

  protected

  def redirect_if_admin
    flash.clear
    if current_admin
      flash[:alert] = "You dont't have access to this action"
      redirect_to(rails_admin.dashboard_path) && return
    end
  end

  def redirect_if_user
    flash.clear
    if current_user
      flash[:alert] = "You dont't have access to this action"
      redirect_to(authenticated_user_root_path) && return
    end
  end

end
