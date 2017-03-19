class CreateSpacePhotos < ActiveRecord::Migration
  def change
    create_table :space_photos do |t|
      t.integer :landlord_id
      t.integer :space_id
      t.string :photo

      t.timestamps

    end
  end
end
