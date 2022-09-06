class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :user_name, presence: true
  validates :user_introduction, presence: true, on: :update
  validates :icon_img, presence: true, on: :update
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :icon_img, RoomPicUploader
end
