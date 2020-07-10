class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.text  :Name
      t.text :Email
      t.text :Address
      t.integer :Phone
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
