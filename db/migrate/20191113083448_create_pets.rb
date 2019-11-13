class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.integer :size, null: false
      t.integer :weight
      t.text :content
      t.text :image
      t.timestamps
    end
  end
end
