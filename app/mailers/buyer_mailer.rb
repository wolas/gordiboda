class BuyerMailer < ApplicationMailer

  def success(email, name)
    @email = email
    @name = name
    mail(to: @email, subject: 'Confirmación de compra')
  end

end
