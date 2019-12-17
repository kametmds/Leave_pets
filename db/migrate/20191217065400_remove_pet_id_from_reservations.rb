class RemovePetIdFromReservations < ActiveRecord::Migration[5.2]
  def up
    remove_column :reservations, :pet_id
  end

  def down
    add_column :reservations, :pet_id, :references
  end
end
