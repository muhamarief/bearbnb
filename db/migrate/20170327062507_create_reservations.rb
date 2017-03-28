class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.integer :rating
      t.string :comment
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
