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

    @order.return_url = execute_paypal_cart_url
    @order.cancel_url = order_cancelled_cart_url
    redirect_to @order.payment.approve_url and return if @order.create_payment
    render :show
  end

  def execute_paypal
    if current_order.execute(params["PayerID"], params["paymentId"])
      current_order.finalize
      session[:order_id] = Order.create.id
      render :order_complete
    else
      redirect_to order_cancelled, :alert => current_order.payment.inspect
    end
  end

  def order_complete
    session[:order_id] = Order.create.id
  end

  def order_cancelled
    current_order.update_attributes(state: "cancelled") unless current_order.state == "approved"
  end

  private
  def order_params
    params.require(:order).permit(:buyer_name, :buyer_email, :contributors, :status)
  end

end
