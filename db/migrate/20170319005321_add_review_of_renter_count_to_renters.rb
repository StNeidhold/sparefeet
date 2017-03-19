class AddReviewOfRenterCountToRenters < ActiveRecord::Migration[5.0]
  def change
    add_column :renters, :review_of_renters_count, :integer
  end
end
