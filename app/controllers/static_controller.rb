class StaticController < ApplicationController

  def home
    @featured_products = Product.all.where("stock > ?", 0).order(:stock).last(3)
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def search
    @query_string = params[:find]
    unless @query_string == ''
      @products = Product.where("price <= ?", "#{@query_string}")
    else
      @products = Product.all
    end

    render :home
  end


end
