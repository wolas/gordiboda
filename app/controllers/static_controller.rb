class StaticController < ApplicationController
  def home
    @products = Product.all.where("stock > ?", 0)
    @order_item = current_order.order_items.new
  end
end
