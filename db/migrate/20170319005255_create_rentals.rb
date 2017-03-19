class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :renter_id
      t.integer :landlord_id
      t.string :monthly_rate
      t.integer :space_id

      t.timestamps

    end
  end
end
