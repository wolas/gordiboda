class AddContributorsToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :contributors, :integer
  end
end
