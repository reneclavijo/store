class OrderMailer < ApplicationMailer

  def send_mail
    @greeting = "Hi"
    @product = params[:product]

    mail(to: "rrodriguez@edutecno.com", subject: "PRUEBA")
  end
end
