class StaticController < ApplicationController

  def home
  end

  def search
  end

  def index
    @query_string = params[:find]
    @products = Product.where("stock > ?", 0).order(price: :desc)
    @products = @products.where("price <= ?", @query_string.to_i) unless @query_string.empty?
  end

  def show
    @product = Product.find(params[:id])
  end


end
