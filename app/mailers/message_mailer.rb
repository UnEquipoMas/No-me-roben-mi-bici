class MessageMailer < ApplicationMailer

  default from: "Your Mailer <dahoyosr@gmail.com>"
  default to: "Your Name <dahoyosr@gmail.com>"

  def new_message(message)
    @contact = message

    mail subject: "Contact from #{message.name}"
  end
    
  def comentario_reporte(name, recipient, report)
    @name = name
    @report = report
    mail to: recipient,  subject: 'NMRB - Tienes un nuevo comentario'
  end

end
