class StaticController < ApplicationController
  def home
    @featured_products = Product.all.where("stock > ?", 0).order(:stock).last(3)
    @products = Product.all.where("stock > ?", 0) - @featured_products
    @order_item = current_order.order_items.new
  end
end
