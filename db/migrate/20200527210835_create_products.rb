class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :catelogy, null: false, foreign_key: true
      t.integer :price
      t.integer :size

      t.timestamps
    end
  end
end
