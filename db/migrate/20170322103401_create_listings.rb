class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :description
      t.string :property_type
      t.string :room_type
      t.string :google_address
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :user, index: true
      t.integer :accomodate, :default => 1
      t.integer :bathroom
      t.boolean :wifi
      t.integer :kitchen
      t.integer :bed
      t.boolean :parking_spot, :default => false
      t.boolean :smoke, :default => false
      t.boolean :pet, :default => false

      t.timestamps
    end
  end
end
