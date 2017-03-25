class AddColumnsToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :price, :integer
    add_column :listings, :city, :string
  end
end
