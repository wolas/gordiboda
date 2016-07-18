class StaticController < ApplicationController

  def home
    @products = Product.all.where("stock > ?", 0)
    @order_item = current_order.order_items.new
  end

  def search
    @query_string = params[:find]
    @products = Product.where("stock > ?", 0).order(price: :desc)
    @products = @products.where("price <= ?", @query_string) unless @query_string.empty?
    render :home
  end


end
