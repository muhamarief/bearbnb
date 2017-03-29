class ChangeDefaultPaid < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :paid
    add_column :reservations, :paid, :boolean, :default => false
  end
end
