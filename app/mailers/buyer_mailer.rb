class BuyerMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def success(email, name)
    @email = email
    @name = name
    @url  = 'http://www.gordiboda.com'
    mail(to: @email, subject: 'Confirmación de compra')
  end

end
