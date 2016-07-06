class Order < ActiveRecord::Base
  has_many :order_items

  def empty?
    order_items.empty?
  end

  def subtotal
    order_items.collect { |oi| oi.quantity * oi.unit_price }.sum
  end

end
