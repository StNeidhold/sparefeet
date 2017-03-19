class CreateReviewOfRenters < ActiveRecord::Migration
  def change
    create_table :review_of_renters do |t|
      t.integer :renter_id
      t.integer :landlord_id
      t.integer :rental_id
      t.integer :renter_rating
      t.string :renter_notes
      t.string :renter_response

      t.timestamps

    end
  end
end
