class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :user, index: true
      t.string :address
      t.integer :price
      t.string :video_url
      t.boolean :pets_allowed
      t.string :renter_ids
      t.text :description
      t.string :title
      t.string :neighborhood
      t.string :borough
      t.boolean :available

      t.timestamps null: false
    end
  end
end
