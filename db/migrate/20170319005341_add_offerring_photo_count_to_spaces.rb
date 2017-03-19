class AddOfferringPhotoCountToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :offerring_photos_count, :integer
  end
end
