class CreateReviewOfLandlords < ActiveRecord::Migration
  def change
    create_table :review_of_landlords do |t|
      t.integer :renter_id
      t.integer :landlord_id
      t.integer :rental_id
      t.integer :landlord_rating
      t.string :landlord_notes
      t.string :landlord_response

      t.timestamps

    end
  end
end
