class CreateProductcarts < ActiveRecord::Migration[6.0]
  def change
    create_table :productcarts do |t|
      t.string :name
      t.decimal :price, precision: 12, scale: 3
      t.boolean :active

      t.timestamps
    end
  end
end
