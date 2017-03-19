class AddReviewOfRenterCountToStewards < ActiveRecord::Migration[5.0]
  def change
    add_column :stewards, :review_of_renters_count, :integer
  end
end
