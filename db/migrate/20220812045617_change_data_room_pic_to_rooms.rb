class ChangeDataRoomPicToRooms < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :room_pic, :string
  end
end
