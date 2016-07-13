class StaticController < ApplicationController

  def home
    @featured_products = Product.all.where("stock > ?", 0).order(:stock).last(3)
    # @products = Product.all.where("stock > ?", 0) - @featured_products
    @products = Product.all
    @order_item = current_order.order_items.new
    # @selected_products = Product.all.where("price < ?", params[:budget])
  end

  def search
    @query_string = params[:find]
    @products = Product.all.where("price < ?", "#{@query_string}")

    render :home
  end


end
