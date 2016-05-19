class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :room_ids
      t.string :video_url
      t.text :description
      t.boolean :has_pets

      t.timestamps null: false
    end
  end
end
