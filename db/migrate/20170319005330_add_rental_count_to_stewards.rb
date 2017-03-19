class AddRentalCountToStewards < ActiveRecord::Migration[5.0]
  def change
    add_column :stewards, :rentals_count, :integer
  end
end
