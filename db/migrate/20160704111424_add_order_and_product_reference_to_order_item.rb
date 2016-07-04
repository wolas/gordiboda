class AddOrderAndProductReferenceToOrderItem < ActiveRecord::Migration
  def change
    add_reference :order_items, :product, index: true
    add_reference :order_items, :order, index: true
  end
end
