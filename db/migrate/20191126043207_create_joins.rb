class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.references :talk, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :joins, [:user_id, :talk_id], unique: true
  end
end
