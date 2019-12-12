class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.references :space, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
