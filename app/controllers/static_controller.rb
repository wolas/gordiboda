class StaticController < ApplicationController
  def home
    @products = Product.all
  end
end
