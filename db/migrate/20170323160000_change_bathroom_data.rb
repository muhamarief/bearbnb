class ChangeKitchenData < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :kitchen, :integer
    add_column :listings, :kitchen, :boolean
  end
end
