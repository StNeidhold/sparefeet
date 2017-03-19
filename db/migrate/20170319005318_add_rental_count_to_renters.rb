class AddRentalCountToRenters < ActiveRecord::Migration[5.0]
  def change
    add_column :renters, :rentals_count, :integer
  end
end
