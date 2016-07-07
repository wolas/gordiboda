class RemoveActiveFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :active, :boolean
  end
end
