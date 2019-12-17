class CreateReservationPets < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_pets do |t|
      t.references :reservation, foreign_key: true
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
