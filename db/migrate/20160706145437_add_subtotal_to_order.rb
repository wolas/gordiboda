class AddSubtotalToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :subtotal, :float
  end
end
