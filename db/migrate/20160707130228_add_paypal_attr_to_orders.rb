class AddPaypalAttrToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :selling_mode, :boolean
    add_column :orders, :state, :string
  end
end
