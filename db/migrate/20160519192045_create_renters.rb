class CreateRenters < ActiveRecord::Migration
  def change
    create_table :renters do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :video_url
      t.boolean :has_pets
      t.text :description
      t.string :room_ids

      t.timestamps null: false
    end
  end
end
