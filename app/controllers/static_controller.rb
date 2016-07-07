class StaticController < ApplicationController
  def home
    @products = Product.where(active: true)
    @order_item = current_order.order_items.new
  end
end
