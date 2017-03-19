class AddReviewOfLandlordCountToRenters < ActiveRecord::Migration[5.0]
  def change
    add_column :renters, :review_of_landlords_count, :integer
  end
end
