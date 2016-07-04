class AddAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :price, :float
    add_column :products, :stock, :integer
    add_column :products, :active, :boolean
  end
end
