class CartsController < ApplicationController
  def show
    @order = current_order
    @order_items = current_order.order_items
    # @order_items = current_order.order_items.order('id')
  end

  private
  def order_params
    params.require(:order).permit(:buyer_name, :buyer_email, :contributors)
  end

end
