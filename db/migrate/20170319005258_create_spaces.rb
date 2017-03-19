class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :landlord_id
      t.string :size
      t.string :notes
      t.string :summary
      t.boolean :allow_boxes
      t.boolean :allow_furniture
      t.boolean :allow_sporting_goods
      t.string :street_address
      t.string :city
      t.string :state
      t.date :availability_date
      t.string :min_term
      t.string :dimensions

      t.timestamps

    end
  end
end
