class Order < ActiveRecord::Base
  has_many :order_items

  before_save :update_subtotal

  def empty?
    order_items.empty?
  end

  def subtotal
    order_items.collect { |oi| oi.quantity * oi.unit_price }.sum
  end

  def finalize
    update_attributes status: "completed", purchased_at: Date.today
    #mailer
  end


  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
