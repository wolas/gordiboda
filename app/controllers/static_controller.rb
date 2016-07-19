class StaticController < ApplicationController

  def home
  end

  def search
  end

  def show
    @query_string = params[:find]
    @products = Product.where("stock > ?", 0).order(price: :desc)
    @products = @products.where("price <= ?", @query_string) unless @query_string.empty?
  end


end
