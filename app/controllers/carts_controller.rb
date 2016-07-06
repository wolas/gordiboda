class CartsController < ApplicationController
  def show
    @order = current_order
    @order_items = current_order.order_items
    # @order_items = current_order.order_items.order('id')
  end

  def pay
    @order = current_order
    @order_items = @order.order_items
    @order.update_attributes(order_params)
    render :show and return unless @order.valid?

    @order.save!

    #paypal
    #current_order.finalize
    #render :order_completed and return
  end

  private
  def order_params
    params.require(:order).permit(:buyer_name, :buyer_email, :contributors, :status)
  end

end
