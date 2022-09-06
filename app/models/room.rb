class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :room_introduction, presence: true
    validates :room_charge, presence: true
    validates :room_address, presence: true
    validates :room_pic, presence: true

    has_many :reservations, dependent: :destroy, foreign_key: "room_id"

    mount_uploader :room_pic, RoomPicUploader
    
end
