class AddStatusToCanpaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :canpaigns, :status, :boolean
  end
end
