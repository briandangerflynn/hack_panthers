class AddThumbnailToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :thumbnail_url, :string
  end
end
