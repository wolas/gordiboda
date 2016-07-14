class StaticController < ApplicationController

  def home
    @products = Product.all.where("stock > ?", 0)
    @order_item = current_order.order_items.new
  end

  def search
    @query_string = params[:find]
    unless @query_string == ''
      @products = Product.where("price <= ? AND stock > ?", "#{@query_string}", 0)
    else
      @products = Product.all.where("stock > ?", 0)
    end

    render :home
  end


end
