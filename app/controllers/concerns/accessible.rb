module Accessible
  extend ActiveSupport::Concern

  included do
    before_action :check_user
  end

  protected

  def check_user
    flash.clear
    if current_admin
      redirect_to(rails_admin.dashboard_path) && return
    elsif current_user
      redirect_to(authenticated_user_root_path) && return
    end
  end
end
