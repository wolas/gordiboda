class Payment < PayPal::SDK::REST::Payment
  include ActiveModel::Validations

  def create
    return false if invalid?
    super

  end

  def error=(error)
    error["details"].each do |detail|
      errors.add detail["field"], detail["issue"]
    end if error and error["details"]
    super
  end

  def order=(order)
    to_params(order.subtotal, order.to_paypal_params, {return: order.return_url.sub(/:order_id/, order.id.to_s), cancel: order.cancel_url.sub(/:order_id/, order.id.to_s)})
  end

  def approve_url
    links.find{|link| link.method == "REDIRECT" }.try(:href)
  end

  def to_params subtotal, items, urls, description = "Compra Gordi Boda"
    self.intent = "sale"
    self.payer.payment_method = "paypal"
    self.experience_profile_id = "XP-KJ27-3NQ5-XQLC-GCVW"
    self.transactions = {
      :amount => {
        :total => sprintf("%0.2f", subtotal),
        :currency => "EUR" },
      :item_list => {
        :items => items
      },
      :description => description
     }
     self.redirect_urls = {
       :return_url => urls[:return],
       :cancel_url => urls[:cancel]
     }
  end

end

