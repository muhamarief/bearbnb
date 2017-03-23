class AddListingsColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :phone_number, :string
    add_column :listings, :email, :string
  end
end
