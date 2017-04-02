class AddRequestStatusToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :request_status, :boolean, default: false
  end
end
