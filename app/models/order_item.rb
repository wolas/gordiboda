class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  before_save :finalize

  def unit_price
    persisted? ? self[:unit_price] : product.price
  end

  def total_price
    unit_price * quantity
  end

  def balance
    balance = product.stock - quantity
    product.update_attributes(stock: balance)
  end

  def to_paypal_params
    {
      :name => product.name,
      :price => sprintf("%0.2f", unit_price),
      :currency => "EUR",
      :quantity => quantity
    }
  end

  private

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
