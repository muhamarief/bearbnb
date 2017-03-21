class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :passport_number, :string
    add_column :users, :nationality, :string
    add_column :users, :city, :string
    add_column :users, :phone_number, :string
  end
end
