class AddUserRefToThumbnails < ActiveRecord::Migration[5.0]
  def change
    add_reference :thumbnails, :user, foreign_key: true
  end
end
