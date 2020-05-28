class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.references :product, null: false, foreign_key: true
      t.text :url

      t.timestamps
    end
  end
end
