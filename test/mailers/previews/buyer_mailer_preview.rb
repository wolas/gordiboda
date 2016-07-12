# Preview all emails at http://localhost:3000/rails/mailers/buyer_mailer
class BuyerMailerPreview < ActionMailer::Preview
  def success_preview
    BuyerMailer.success(Order.first.buyer_email, Order.first.buyer_name)
  end
end
