class RemoveContributorsForOrderItems < ActiveRecord::Migration
  def change
    remove_column :order_items, :contributors
    add_column :orders, :contributors, :integer
  end
end
