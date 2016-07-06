class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_order

  # def current_order
#     if !session[:order_id].nil?
#       Order.find(session[:order_id])
#     else
#       Order.new
#     end
#   end

  def current_order
    order = Order.find_by_id(session[:order_id]) || Order.create
    session[:order_id] = order.id
    order
  end

end
