class BuyerMailer < ApplicationMailer

  def success(email, name)
    @email = email
    @name = name
    mail(to: @email, subject: 'Confirmacion de compra')
  end

end
