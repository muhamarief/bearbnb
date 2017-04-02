class ChangeDefaultReservationStatus < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :request_status
    add_column :reservations, :request_status, :boolean
  end
end
