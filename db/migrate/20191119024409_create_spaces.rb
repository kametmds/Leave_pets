class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :title, null: false
      t.text :picture, null: false
      t.string :postal, null: false
      t.string :address, null: false
      t.string :tel, null: false
      t.text :content
      t.integer :capacity
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
