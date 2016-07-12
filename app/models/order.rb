class Order < ActiveRecord::Base
  has_many :order_items

  before_save :update_subtotal

  attr_accessor :return_url, :cancel_url

  def empty?
    order_items.empty?
  end

  def subtotal
    order_items.collect { |oi| oi.quantity * oi.unit_price }.sum
  end

  def finalize
    update_attributes status: "completed", purchased_at: Date.today
    @products = order_items.map{|oi| oi.product}
    @products.map{|p| p.update_attributes(stock: (p.stock - 1))}

    BuyerMailer.success(buyer_email, buyer_name).deliver_later
  end

  def to_paypal_params
    order_items.map(&:to_paypal_params)
  end

  def payment
    @payment ||= payment_id && Payment.find(payment_id)
  end

  def create_payment
    @payment = Payment.new( :order => self )
    return @payment if @payment.create and update_attributes(payment_id: @payment.id, state: @payment.state)

    errors.add :payment_method, @payment.error["message"] if @payment.error
    return @payment
  end

  def execute(payer_id, payment_id)
    return true if payment.present? and payment.execute(:payer_id => payer_id) and update_attributes(selling_mode: false, state: payment.state, payer_id: payer_id, payment_id: payment_id)
    errors.add :description, payment.error.inspect
    false
  end


  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
