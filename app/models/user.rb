class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  def full_name
    "#{name} #{last_name}"
  end


  def profile_info_is_complete?
    name.present? && last_name.present? && description.present? && twitter_handle.present?
  end

end
