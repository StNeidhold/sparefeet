class AddRentalCountToSpaces < ActiveRecord::Migration[5.0]
  def change
    add_column :spaces, :rentals_count, :integer
  end
end
