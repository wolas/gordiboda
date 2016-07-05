class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  private
  def order_params
    params.require(:order).permit(:buyer_name, :buyer_email, :contributors)
  end

end
