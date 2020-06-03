class AddValueToCanpaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :canpaigns, :value, :integer
  end
end
