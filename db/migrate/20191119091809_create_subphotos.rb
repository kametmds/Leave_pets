class CreateSubphotos < ActiveRecord::Migration[5.2]
  def change
    create_table :subphotos do |t|
      t.text :subpicture
      t.timestamps
    end
    add_reference :subphotos, :space, foreign_key: true
  end
end
