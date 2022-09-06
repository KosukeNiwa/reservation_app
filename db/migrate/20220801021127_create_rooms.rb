class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :room_introduction
      t.integer :room_charge
      t.text :room_address
      t.binary :room_pic

      t.timestamps
    end
  end
end
