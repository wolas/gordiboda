class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_column :orders, :purchased_at, :datetime
  end
end
